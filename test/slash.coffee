# / operator tests

test = require './helper'

test 'string split',
  '"a s d f"" "/~'
  '"a" "s" "d" "f"'

test 'array each',
  '[1 2 3]{1+}/'
  '2 3 4'

test 'array each reversed params',
  '{1+}[1 2 3]/'
  '2 3 4'
