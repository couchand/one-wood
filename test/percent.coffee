# % operator tests

test = require './helper'

test 'map array',
  '[1 2 3]{.}%~'
  '1 1 2 2 3 3'

test 'map array reversed params',
  '{.}[1 2 3]%~'
  '1 1 2 2 3 3'
