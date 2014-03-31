# ? operator tests

test = require './helper'

test 'integers calculate exponent',
  '3 2?'
  '9'

test 'array and integer calculate indexOf',
  '[1 2 3] 2?'
  '1'

test 'array indexOf reversed',
  '2 [1 2 3]?'
  '1'

test 'array indexOf returns -1 when not found',
  '[1 2 3] 4?'
  '-1'

test 'string indexOf',
  '"foobar""b"?'
  '3'

test 'array and string indexOf',
  '["foo" "bar" "baz"]"bar"?'
  '1'

test 'array and string indexOf reversed',
  '"bar"["foo" "bar" "baz"]?'
  '1'

test 'array and block finds satisfier',
  '[1 2 3]{;1}?'
  '1'

test 'array and block returns -1 when none found',
  '[1 2 3]{;0}?'
  '-1'

test 'array and block reversed',
  '{;1}[1 2 3]?'
  '1'
