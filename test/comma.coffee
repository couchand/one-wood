# , builtin tests

test = require './helper'

test 'zero creates empty array',
  '0,',
  '[]'

test 'integer creates count array',
  '10,~',
  '0 1 2 3 4 5 6 7 8 9'

test 'empty array gets zero',
  '[],',
  '0'

test 'array gets length',
  '[0 1 2 3 4 5 6 7 8 9],',
  '10'

test 'empty string gets zero',
  '"",',
  '0'

test 'string gets length',
  '"0123456789",',
  '10'

test 'block selects array',
  '[0 1 0 2 0 3 0 4]{},~',
  '1 2 3 4'

test 'no block selects empty array',
  '[1 2 3 4 5 6 7]{;0},',
  '[]'

test 'yes block selects whole array',
  '[1 2 3 4 5]{;1},~',
  '1 2 3 4 5'
