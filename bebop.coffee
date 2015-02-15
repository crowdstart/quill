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
  staticDir: 'docs/'

  pre: kss

  include: [
    /docs/
    /guide/
    /src/
  ]

  compilers:
    html: (src) ->
      kss() if /^guide/.test src

    md: ->
      kss() if /^guide/.test src

    styl: (src) ->
      "#{stylus} guide/styles.styl -o docs/public"
