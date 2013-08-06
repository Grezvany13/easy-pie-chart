module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    banner: '/**!\n' +
            ' * <%= pkg.name %>\n' +
            ' * <%= pkg.description %>\n' +
            ' *\n' +
            ' * @license <%= pkg.license %>\n'+
            ' * @author <%= pkg.author.name %> <<%= pkg.author.email %>>\n' +
            ' * @version <%= pkg.version %>\n' +
            ' **/\n'

    clean:
      tmp: ['tmp']
      dist: ['dist']

    coffee:
      compile:
        expand: true
        flatten: true
        cwd: 'src'
        src: ['*.coffee']
        dest: 'tmp'
        ext: '.js'

    concat:
      options:
        banner: '<%= banner %>'
      js:
        src: ['tmp/<%= pkg.name %>.js']
        dest: 'dist/jquery.<%= pkg.name %>.js'
      css:
        src: ['src/<%= pkg.name %>.css']
        dest: 'dist/jquery.<%= pkg.name %>.css'

    uglify:
      dist:
        options:
          banner: '<%= banner %>'
        files:
          'dist/jquery.<%= pkg.name %>.min.js': ['tmp/<%= pkg.name %>.js']


  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'


  grunt.registerTask 'default', ['clean', 'coffee', 'uglify', 'concat', 'clean:tmp']

