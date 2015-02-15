exec = require 'executive'

stylus  = 'node_modules/.bin/stylus --sourcemap --sourcemap-inline'
kssBin  = 'node_modules/.bin/kss-node'
kssArgs = '--template=guide/template --source=src --source=guide --destination=docs --mask=*.styl'

kss = (done = ->) ->
  exec [
    "#{kssBin} #{kssArgs}"
    "#{stylus} guide/styles.styl -o docs/public"
  ], done

module.exports =
  pre: kss
  staticDir: 'docs/'

  include: [
    /docs/
    /guide/
    /src/
  ]

  compilers:
    html: (src) -> kss() if /^guide/.test src
    md:   (src) -> kss() if /^guide/.test src
    styl: (src) -> "#{stylus} guide/styles.styl -o docs/public"
