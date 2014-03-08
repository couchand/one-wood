# stack

types = require './types'

class Stack
  constructor: ->
    @stack = []
    @cursor = 0

  push: (el) ->
    return this if el instanceof types.Unknown
    @stack.push el
    this

  peek: ->
    return new types.Unknown() if @stack.length is 0
    @stack[@stack.length-1]

  pop: ->
    @stack.pop()

  swap: ->
    p = @stack.length - 2
    return this unless p >= 0
    @cursor = p if p < @cursor
    @push @stack.splice(-2, 1)[0]

  rotate: ->
    p = @stack.length - 3
    return this unless p >= 0
    @cursor = p if p < @cursor
    @push @stack.splice(-3, 1)[0]

  get: (n) ->
    return new types.Unknown() if n < 0 or n >= @stack.length
    return @peek() if n is 0
    @stack.slice((-1 - n), -n)[0]

  copy: (n) ->
    @push @get n

  mark: ->
    @cursor = @stack.length
    this

  slice: ->
    s = @stack.splice @cursor
    @cursor = 0
    new types.Array s

module.exports = Stack
