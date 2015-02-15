exec = require('executive').interactive

task 'docs', 'compile styleguide', ->
  exec 'node_modules/.bin/bebop --compile-only'

task 'watch', 'watch for changes and recompile styleguide', ->
  exec 'node_modules/.bin/bebop'
