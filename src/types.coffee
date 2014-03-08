# types

class Unknown
  constructor: (@v) ->

class Integer
  constructor: (@v) ->

class Array
  constructor: (@v) ->

class String
  constructor: (@v) ->

class Block
  constructor: (@v, @compiled) ->

  compile: ->
    return @compiled if @compiled
    @compiled = ->

  run: (stack, scope) ->
    @compile()
    @compiled stack, scope

module.exports = {Unknown, Integer, Array, String, Block}
