# / operator tests

test = require './helper'

test 'array each',
  '[1 2 3]{1+}/'
  '2 3 4'

test 'array each reversed params',
  '{1+}[1 2 3]/'
  '2 3 4'
