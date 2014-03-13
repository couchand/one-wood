# @ operator tests

test = require './helper'

test 'rotates top three elements',
  '1 2 3 4 5 6 7@',
  '1 2 3 4 6 7 5'
