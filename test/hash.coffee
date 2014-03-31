# # comment tests

test = require './helper'

test 'comments are ignored',
  '42 # 42 -\n'
  '42'
