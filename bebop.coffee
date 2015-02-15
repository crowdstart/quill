fs   = require 'fs'
path = require 'path'

kss = 'node_modules/.bin/kss-node'

module.exports =
  cwd: process.cwd()

  compilers:
    styl: ->
      "#{kss} src docs"
