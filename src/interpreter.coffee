# the interpreter

Lexer = require './lexer'
Scope = require './scope'
Stack = require './stack'
types = require './types'

class Interpreter
  constructor: (input) ->
    @lexer = new Lexer input
    @scope = new Scope()
    @stack = new Stack()

  step: ->
    token = @lexer.pop()

    if token is ':'
      name = @lexer.pop()
      @scope.set name, @stack.peek()
      return

    value = @scope.get token
    if value instanceof types.Unknown
    else if value instanceof types.Block
      value.run @stack, @scope
    else
      @stack.push value

  run: ->
    while @lexer.peek()
      @step()
    @stack

module.exports = Interpreter
