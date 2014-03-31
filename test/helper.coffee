# test helper

Interpreter = require '../src/interpreter'
Lexer = require '../src/lexer'

module.exports = test = (message, input, expected) ->
  code = "#{input}]`"
  interpreter = new Interpreter new Lexer code
  actual = interpreter.run().stack[0].v[1...-1]
  console.log """
              #{message}: #{input}
                Expected: #{expected}
                Actual  : #{actual}
              """ if actual isnt expected
