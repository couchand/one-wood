# > operator tests

test = require './helper'

test 'larger integer returns 1',
  '3 2>'
  '1'

test 'smaller integer returns 0',
  '2 3>'
  '0'

test 'larger string returns 1',
  '"foo""doo">'
  '1'

test 'smaller string returns 0',
  '"foo""goo">'
  '0'

test 'integer indexes into array',
  '[1 2 3] 1>'
  '[3]'

test 'integer index reversed',
  '1 [1 2 3]>'
  '[3]'
