# tokenizing lexer

# TODO steal the regex from gs.com

token = ///
        [a-zA-Z_][a-zA-Z0-9_]*  | # identifier
        -?[0-9]+                | # number
        "[^"]*"                 | # string
        .                         # operator
        ///

class StringLexer
  constructor: (@input) ->

  peek: ->
    return no unless @input.length
    @input.match(token)[0]

  pop: ->
    return no unless @input.length
    t = @peek()
    @input = @input[t.length..]
    t

module.exports = StringLexer
