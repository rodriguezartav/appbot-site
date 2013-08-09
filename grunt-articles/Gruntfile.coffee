module.exports = (grunt) ->

  
  grunt.initConfig
    
    clean:
      tests: ['tmp'],

    coffee:
      sourceFiles:
        files: "tasks/articles.js" : "tasks/articles.coffee"

    articles:
      createJson:
        options:
          src: "./test/fixtures/articles"
          dest: "./tmp/articles.json"

    watch:
      source:
        files: ["./tasks/*.coffee"]
        tasks: ["clean","coffee","articles" , "nodeunit"]

    nodeunit:
      tests: ['test/*_test.js']

  grunt.loadTasks('tasks'); 
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-mocha-test');
  grunt.loadNpmTasks('grunt-contrib-nodeunit');

