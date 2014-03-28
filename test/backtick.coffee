# ` operator tests

test = require './helper'

test 'integer string representation',
  '1`'
  '"1"'

test 'string string representation',
  '"foo"`'
  '"\\"foo\\""'

test 'array string representation',
  '[1 2 3]`'
  '"[1 2 3]"'

test 'custom block string representation',
  '{1 2 3}`'
  '"{1 2 3}"'

test 'nested block string representation',
  '{{1 2 3}}`'
  '"{{1 2 3}}"'
