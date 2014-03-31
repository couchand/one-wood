# types

class Unknown
  constructor: (@v) ->

class KnownValue
  constructor: ->
  toString: ->
    new String @v
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
  exp: (other) ->
    new Integer @v ** other.v

class Array extends KnownValue
  constructor: (@v) ->
  empty: -> @v.length is 0
  toString: ->
    els = (e.toString().v for e in @v)
    new String "[#{els.join ' '}]"
  sort: (block, stack) ->
    if block
      map = (v) ->
        stack.push v
        block.run stack
        stack.pop()
      new Array @v.sort (a, b) ->
        am = map a
        bm = map b
        am.compare bm
    else
      new Array @v.sort (a, b) ->
        a.compare b
  first: (block, stack) ->
    map = (v) ->
      stack.push v
      block.run stack
      stack.pop()
    for el in @v when not map(el).empty()
      return el
    new Integer -1
  select: (block, stack) ->
    map = (v) ->
      stack.push v
      block.run stack
      stack.pop()
    new Array (el for el in @v when not map(el).empty())
  each: (block, stack) ->
    for el in @v
      stack.push el
      block.run stack
  map: (block, stack) ->
    stack.mark()
    @each block, stack
    stack.slice()
  selectNonEmpty: ->
    new Array @v.filter (el) -> not el.empty()
  find: (needle) ->
    new Integer @v.indexOf needle

backslash = new RegExp "\\\\", 'g'
doublequote = new RegExp '"', 'g'
backslash_e = new RegExp "\\\\\\\\", 'g'
doublequote_e = new RegExp '\\"', 'g'

class String extends KnownValue
  constructor: (@v) ->
    @v = "#{@v}".replace doublequote_e, '"'
      .replace backslash_e, "\\"
  empty: -> @v.length is 0
  toString: ->
    escaped = @v.replace backslash, "\\\\"
      .replace doublequote, '\\"'
    new String "\"#{escaped}\""
  sort: ->
    new String @v.split('').sort().join('')
  split: (s) ->
    new Array (new String part for part in @v.split s.v)
  find: (s) ->
    new Integer @v.indexOf s.v

class Block extends KnownValue
  constructor: (@v, @f) ->
  empty: -> @v.length is 0
  toString: ->
    new String "{#{@v}}"
  run: (stack) ->
    @f stack

class Builtin extends Block
  constructor: (@f) ->
    super '<native code>', @f

module.exports = {Unknown, Integer, Array, String, Block, Builtin}
