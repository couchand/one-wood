# < operator tests

test = require './helper'

test 'larger integer returns 0',
  '3 2<'
  '0'

test 'smaller integer returns 1',
  '2 3<'
  '1'

test 'larger string returns 0',
  '"foo""doo"<'
  '0'

test 'smaller string returns 1',
  '"foo""goo"<'
  '1'

test 'integer indexes into string',
  '"foobar"4<'
  '"foob"'

test 'integer index reversed',
  '4"foobar"<'
  '"foob"'

test 'integer indexes into array',
  '[1 2 3] 1<'
  '[1]'

test 'integer index reversed',
  '1 [1 2 3]<'
  '[1]'
