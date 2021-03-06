# the interpreter

Scope = require './scope'
Stack = require './stack'
types = require './types'

class Interpreter
  constructor: (@lexer, @scope, @stack) ->
    @scope ?= new Scope()
    @stack ?= new Stack()
    @source = ''

  step: ->
    token = @lexer.pop()

    if token is ':'
      name = @lexer.pop()
      return (stack) =>
        @scope.set name, stack.peek()

    if token is '{'
      child = new Interpreter @lexer, @scope
        .compile()
      @source += "{#{child.source}}"
      return (stack) =>
        stack.push new types.Block child.source, child

    @source += token
    (stack) =>
      value = @scope.get token
      if value instanceof types.Unknown
      else if value instanceof types.Block
        value.run stack
      else
        stack.push value

  run: ->
    while @lexer.peek()
      @step()(@stack)
    @stack

  compile: ->
    fns = []
    while (t = @lexer.peek()) and t isnt '}'
      fns.push @step()
    @lexer.pop() if @lexer.peek() is '}'
    fn = (stack) ->
      fn.call null, stack for fn in fns when fn
      stack
    fn.source = @source
    fn

module.exports = Interpreter
