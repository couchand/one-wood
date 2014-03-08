# builtins

types = require './types'

b = (f) ->
  new types.Block '<native code>', f

module.exports =
  '.':  b (stack) -> stack.copy 0
  ';':  b (stack) -> stack.pop()
  '@':  b (stack) -> stack.rotate()
  '\\': b (stack) -> stack.swap()
  '!':  b (stack) ->
    stack.push new types.Integer if stack.pop().empty() then 1 else 0
  '$':  b (stack) ->
    v = stack.pop()
    if v instanceof types.Integer
      stack.copy v.v
    else if v instanceof types.Block
      # TODO: sort by mapping
    else
      stack.push v.sort()
  '[':  b (stack) -> stack.mark()
  ']':  b (stack) -> stack.push stack.slice()
  '~':  b (stack) ->
    v = stack.pop()
    if v instanceof types.Array
      stack.push el for el in v.v
    else if v instanceof types.Integer
      # TODO: bitwise not
    else
      # TODO: eval
