fs   = require 'fs'
path = require 'path'

stylus  = 'node_modules/.bin/stylus -u --sourcemap --sourcemap-inline'
kss     = 'node_modules/.bin/kss-node --css'

module.exports =
  cwd: process.cwd()

  compilers:
    styl: ->
      "stylus test\\styles.styl test\\styles.css #{kss} test\\styles.css test docs"
