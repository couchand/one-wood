# test helper

Interpreter = require '../src/interpreter'
Lexer = require '../src/lexer'

module.exports = test = (message, input, expected) ->
  code = "#{input}]`"
  interpreter = new Interpreter new Lexer code
  console.log """
              #{message}: #{input}
                Expected: #{expected}
                Actual  : #{interpreter.run().stack[0].v[1...-1]}
              """
