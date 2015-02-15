exec = require 'executive'
fs   = require 'fs'
path = require 'path'

stylus  = 'node_modules/.bin/stylus --sourcemap --sourcemap-inline'
kssBin  = 'node_modules/.bin/kss-node'
kssArgs = '--template=guide/template --source=src --source=guide --destination=docs --mask=*.styl'

kss = (cb = ->) ->
  exec "#{kssBin} #{kssArgs}", ->
    exec "#{stylus} guide/styles.styl -o docs/public", cb

module.exports =
  cwd: process.cwd()

  pre: kss

  include: [
    /docs/
    /guide/
    /src/
  ]

  compilers:
    html: (src) ->
      if /^guide/.test src
        kss()

    md: ->
      if /^guide/.test src
        kss()

    styl: (src) ->
      "#{stylus} guide/styles.styl -o docs/public"
