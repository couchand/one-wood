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

class Array extends KnownValue
  constructor: (@v) ->
  empty: -> @v.length is 0
  sort: ->
    new Array @v.sort (a, b) -> a.compare b

class String extends KnownValue
  constructor: (@v) ->
  empty: -> @v.length is 0
  sort: ->
    new String @v.split('').sort().join('')

class Block extends KnownValue
  constructor: (@v, @compiled) ->
  empty: -> @v.length is 0

  compile: ->
    return @compiled if @compiled
    @compiled = ->

  run: (stack, scope) ->
    @compile()
    @compiled stack, scope

module.exports = {Unknown, Integer, Array, String, Block}
