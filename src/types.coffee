# types

class Unknown
  constructor: (@v) ->

class KnownValue
  constructor: ->
  compare: (other) ->
    if @v is other.v
      0
    else if @v > other.v
      1
    else
      -1

class Integer extends KnownValue
  constructor: (@v) ->
    @v = parseInt @v
  empty: -> @v is 0
  not: ->
    new Integer ~@v
  plus: (other) ->
    new Integer @v + other.v
  minus: (other) ->
    new Integer @v - other.v
  times: (other) ->
    new Integer @v * other.v

class Array extends KnownValue
  constructor: (@v) ->
  empty: -> @v.length is 0
  sort: (block, stack) ->
    map = (v) ->
      stack.push v
      block.run stack
      stack.pop()
    if block
      new Array @v.sort (a, b) ->
        am = map a
        bm = map b
        am.compare bm
    else
      new Array @v.sort (a, b) ->
        a.compare b
  select: (block, stack) ->
    map = (v) ->
      stack.push v
      block.run stack
      stack.pop()
    new Array (el for el in @v when not map(el).empty())
  map: (block, stack) ->
    stack.mark()
    for el in @v
      stack.push el
      block.run stack
    stack.slice()

class String extends KnownValue
  constructor: (@v) ->
  empty: -> @v.length is 0
  sort: ->
    new String @v.split('').sort().join('')

class Block extends KnownValue
  constructor: (@v, @f) ->
  empty: -> @v.length is 0
  run: (stack) ->
    @f stack

class Builtin extends Block
  constructor: (@f) ->
    super '<native code>', @f

module.exports = {Unknown, Integer, Array, String, Block, Builtin}
