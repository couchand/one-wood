one-wood
========

a GolfScript interpreter written in CoffeeScript

 * introduction
 * requirements
 * getting started
 * reference implementation notes
 * more information

introduction
------------

GolfScript is a language designed to aid in code golf - recreational
programming with the goal of writing the shortest possible program.

![XKCD 1313](http://imgs.xkcd.com/comics/regex_golf.png)

**one-wood** is an interpreter for GolfScript.  Written in
CoffeeScript, **one-wood** is intended to be used in the browser.
Unlike the reference implementation, **one-wood** is ***not*** intended
to be itself code golf.

requirements
------------

 * coffee-script >1.7.0

getting started
---------------

If you have CoffeeScript installed globally, you can use the CLI after
cloning the git repository immediately.  Try something like

  > ./one-wood '3 2 1]$~'

or

  > ./one-wood < program.gs

reference implementation notes
------------------------------

The reference implementation is considered to be the
[golfscript.com](http://www.golfscript.com) Ruby implementation.
If you find anywhere that **one-wood** deviates from the reference,
please do submit an
[issue](https://github.com/couchand/one-wood/issues) or pull request.

more information
----------------

*The rain in Spain falls mainly on the plain.*
