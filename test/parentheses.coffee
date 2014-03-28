# ( and ) operator tests

test = require './helper'

test ') increments integer',
  '1)'
  '2'

test '( decrements integer',
  '2('
  '1'

test ') uncons from back',
  '[1 2])'
  '[1] 2'

test '( uncons from front',
  '[1 2]('
  '[2] 1'
