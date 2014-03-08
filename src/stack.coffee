# stack

class Stack
  constructor: ->
    @stack = []

  push: (el) ->
    @stack.push el
    this

  peek: ->
    @stack[@stack.length-1]

  pop: ->
    @stack.pop()

  swap: ->
    @push @stack.splice(-2, 1)[0]

  rotate: ->
    @push @stack.splice(-3, 1)[0]

  get: (n) ->
    return @peek() if n is 0
    @stack.slice((-1 - n), -n)[0]

  copy: (n) ->
    @push @get n

  mark: ->
    @cursor = @stack.length
    this

  slice: ->
    @cursor ?= 0
    s = @stack.splice @cursor
    @cursor = 0
    s

module.exports = Stack
