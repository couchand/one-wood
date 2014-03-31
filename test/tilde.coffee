# ~ operator tests

test = require './helper'

test '~ splats arrays',
  '[1 2 3]~'
  '1 2 3'

test '~ bitwise inverts numbers',
  '1~'
  '-2'

test '~ bitwise inverts numbers',
  '-1~'
  '0'

test '~ runs custom blocks',
  '[3 2 1]{$}~'
  '[1 2 3]'
