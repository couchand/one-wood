# builtins

types = require './types'

b = (f) ->
  new types.Block '<native code>', f

module.exports =
  '.':  b (stack) -> stack.copy 0
  ';':  b (stack) -> stack.pop()
  '@':  b (stack) -> stack.rotate()
  '\\': b (stack) -> stack.swap()
