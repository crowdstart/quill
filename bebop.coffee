fs   = require 'fs'
path = require 'path'

stylus  = 'node_modules/.bin/stylus --sourcemap --sourcemap-inline'
kss     = 'node_modules/.bin/kss-node'
kssArgs = '--template=guide/template --source=src --source=guide --mask="*.styl" --destination=docs'

module.exports =
  cwd: process.cwd()

  include: [
    /guide/
  ]

  compilers:
    html: ->
      "#{kss} #{kssArgs}"

    md: ->
      "#{kss} #{kssArgs}"

    styl: (file) ->
      "#{stylus} #{file} -o docs/public"
