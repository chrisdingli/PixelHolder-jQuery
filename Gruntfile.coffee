module.exports = (grunt) ->
  # Project configuration.
  @initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      compile:
        files:
          'dist/pixelholder-jquery.js': 'coffee/pixelholder-jquery.coffee'
    uglify:
      target:
        files:
          'dist/pixelholder-jquery.min.js': 'dist/pixelholder-jquery.js'
    watch:
      coffee:
        files: ['coffee/*.coffee']
        tasks: ['coffee']
      js:
        files: ['dist/*.js']
        tasks: ['uglify']

  @loadNpmTasks 'grunt-contrib-coffee'
  @loadNpmTasks 'grunt-contrib-watch';
  @loadNpmTasks 'grunt-contrib-uglify';

  # Default task(s).
  @registerTask 'default', ['coffee', 'uglify']
