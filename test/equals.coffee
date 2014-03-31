# = operator tests

test = require './helper'

test 'equal integers return 1',
  '2 2='
  '1'

test 'unequal integers return 0',
  '2 3='
  '0'

test 'equal strings return 1',
  '"foo""foo"='
  '1'

test 'unequal strings return 0',
  '"foobar""foo"='
  '0'

test 'integer indexes into string',
  '"foobar" 3='
  '"b"'

test 'integer index reversed',
  '3"foobar"='
  '"b"'

test 'integer indexes into array',
  '[1 2 3] 1='
  '2'

test 'integer index reversed',
  '1 [1 2 3]='
  '2'
