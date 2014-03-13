# test helper

Interpreter = require '../src/interpreter'
Lexer = require '../src/lexer'

module.exports = test = (message, input, expected) ->
  interpreter = new Interpreter new Lexer input
  actual = (val.v for val in interpreter.run().stack)
  console.log """
              #{message}
              Expected: [#{expected}]
              Actual  : #{JSON.stringify actual}
              """
