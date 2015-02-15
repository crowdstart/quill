exec = require('executive').interactive

# Compile style guide into docs/
kss = (done = ->) ->
  bin  = 'node_modules/.bin/kss-node'
  args = '--template=guide/template --source=src --source=guide --destination=docs --mask=*.styl'
  exec "#{bin} #{args}", -> stylus done

# Compile stylus from guide into docs/
stylus = (done = ->) ->
  bin  = 'node_modules/.bin/stylus'
  args = '-u autoprefixer-stylus --sourcemap --sourcemap-inline guide/template/public -o docs/public'
  exec "#{bin} #{args}", done

module.exports =
  pre:       kss
  staticDir: 'docs/'

  include: [
    /docs/
    /guide/
    /src/
  ]

  compilers:
    html: (src) -> kss() if /^guide/.test src
    md:   (src) -> kss() if /^guide/.test src
    styl: (src) -> stylus()
