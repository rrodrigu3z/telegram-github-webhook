module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-nodemon'
  
  grunt.initConfig
    watch:
      coffeeServer:
        files: 'src/*.coffee'
        tasks: ['coffee:compileServer']
    
    coffee:
      compileServer:
        expand: true
        flatten: true
        options:
          sourceMap: true
        cwd: 'src/'
        src: ['*.coffee']
        dest: 'lib/'
        ext: '.js'
  
    nodemon:
      dev:
        script: 'lib/server.js'
        watch: 'lib'
        ext: '*'
        options:
          nodeArgs: ['--debug']
  
  grunt.registerTask('build', ['coffee'])
  grunt.registerTask('default', ['build'])