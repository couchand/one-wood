# \ operator tests

test = require './helper'

test 'swaps top two elements',
  '1 2 3 4 5\\',
  '1 2 3 5 4'
