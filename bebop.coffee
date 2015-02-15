exec = require 'executive'
fs   = require 'fs'
path = require 'path'

stylus  = 'node_modules/.bin/stylus --sourcemap --sourcemap-inline'
kss     = 'node_modules/.bin/kss-node'
kssArgs = '--template=guide/template --source=src --source=guide --mask="*.styl" --destination=docs'

module.exports =
  cwd: process.cwd()

  pre: (done) ->
    exec "#{kss} #{kssArgs}", done

  include: [
    /docs/
    /guide/
    /src/
  ]

  compilers:
    html: (src) ->
      if /^guide/.test src
        "#{kss} #{kssArgs}"

    md: ->
      if /^guide/.test src
        "#{kss} #{kssArgs}"

    styl: (src) ->
      "#{stylus} guide/styles.styl -o docs/public"
