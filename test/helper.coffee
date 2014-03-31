# test helper

Interpreter = require '../src/interpreter'
Lexer = require '../src/lexer'

module.exports = test = (message, input, expected) ->
  interpreter = new Interpreter new Lexer input
  actual = (val.toString().v for val in interpreter.run().stack)
  console.log """
              #{message}: #{input}
                Expected: #{expected}
                Actual  : #{actual}
              """
