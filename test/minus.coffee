# - operator tests

test = require './helper'

test 'integers subtract',
  '2 1-',
  '1'

test 'correct sign',
  '1 2-',
  '-1'
