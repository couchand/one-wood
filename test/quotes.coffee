# " and ' tests

test = require './helper'

test 'double quotes make strings',
  '"foobar"'
  '"foobar"'

test 'characters are escapable in double quotes',
  '"\\""'
  '"\\\\""'
