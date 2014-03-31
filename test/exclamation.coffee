# ! operator tests

test = require './helper'

test 'zero returns one',
  '0!',
  '1'

test 'integer returns zero',
  '42!',
  '0'

test 'empty string returns one',
  '""!',
  '1'

test 'string returns zero',
  '"foobar"!',
  '0'

test 'empty array returns one',
  '[]!',
  '1'

test 'array returns zero',
  '[1 2 3]!',
  '0'

test 'empty block returns one',
  '{}!',
  '1'

test 'block returns zero',
  '{1 2 3}!',
  '0'
