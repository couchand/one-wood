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
    value = @scope.get token
    @stack.push value unless value instanceof types.Unknown

  run: ->
    while @lexer.peek()
      @step()
    @stack

module.exports = Interpreter
