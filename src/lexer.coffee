# tokenizing lexer

# TODO steal the regex from gs.com

token = ///
        [a-zA-Z_][a-zA-Z0-9_]*  | # identifier
        -?[0-9]+                | # number
        "(\\\\|\\"|[^"])*"      | # string
        \#                      | # comments
        .                       | # operator
        \n
        ///

class StringLexer
  constructor: (@input) ->

  peek: ->
    return no unless @input.length
    t = @input.match(token)[0]
    if t is '#'
      while t isnt '\n'
        @input = @input[1..]
        t = @input.match(token)[0]
    t

  pop: ->
    return no unless @input.length
    t = @peek()
    @input = @input[t.length..]
    t

module.exports = StringLexer
