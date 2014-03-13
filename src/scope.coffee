# scope

builtins = require './builtins'
types = require './types'

makeLiteral = (v) ->
  if v[0] is '"'
    new types.String v[1...v.length-1]
  else if /[-0-9]/.test v[0]
    new types.Integer v
  else
    new types.Unknown v

class Scope
  constructor: ->
    @variables = builtins

  set: (name, value) ->
    @variables[name] = value

  get: (name) ->
    if name of @variables
      @variables[name]
    else
      @variables[name] = makeLiteral name

module.exports = Scope
