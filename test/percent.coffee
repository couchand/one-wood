# % operator tests

test = require './helper'

test 'split string remove empties',
  '"assdfs" "s"%~'
  '"a" "df"'

test 'map array',
  '[1 2 3]{.}%~'
  '1 1 2 2 3 3'

test 'map array reversed params',
  '{.}[1 2 3]%~'
  '1 1 2 2 3 3'
