# builtins

types = require './types'

b = (f) ->
  new types.Builtin f

module.exports =
  '.':  b (stack) -> stack.copy 0
  ';':  b (stack) -> stack.pop()
  '@':  b (stack) -> stack.rotate()
  '\\': b (stack) -> stack.swap()
  '!':  b (stack) ->
    stack.push new types.Integer if stack.pop().empty() then 1 else 0
  '+':  b (stack) ->
    b = stack.pop()
    a = stack.pop()
    if a instanceof types.Integer and b instanceof types.Integer
      stack.push a.plus b
    else
      # TODO: others
      throw new Error 'unimplemented'
  '-':  b (stack) ->
    b = stack.pop()
    a = stack.pop()
    if a instanceof types.Integer and b instanceof types.Integer
      stack.push a.minus b
    else
      # TODO: others
      throw new Error 'unimplemented'
  '*':  b (stack) ->
    b = stack.pop()
    a = stack.pop()
    if a instanceof types.Integer and b instanceof types.Integer
      stack.push a.times b
    else
      # TODO: others
      throw new Error 'unimplemented'
  '$':  b (stack) ->
    v = stack.pop()
    if v instanceof types.Integer
      stack.copy v.v
    else if v instanceof types.Block
      r = stack.pop()
      stack.push r.sort v
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
  n:  b (stack) -> stack.push new types.String "\n"
  print:  b (stack) ->
    v = stack.pop()
    console.log "#{v.v}"
  puts:   b (stack) ->
    v = stack.pop()
    console.log "#{v.v}\n"
