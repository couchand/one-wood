# ; operator tests

test = require './helper'

test 'pops top of stack',
  '1 2 3;',
  '1 2'
