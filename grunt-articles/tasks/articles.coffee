#
# * grunt-articles
# * https://github.com/roberto/grunt-articles
# *
# * Copyright (c) 2013 Roberto Rodriguez
# * Licensed under the MIT license.
# 
"use strict"

class Articles

  @capitalize: (s) ->
    return s.toLowerCase().replace /\b./g, (a) -> return a.toUpperCase()

  @dirNameToObject: (name,path) ->
    parts = name.split("_")
    name = parts[1]
    name = name.replace("-" , " ")
    name = @capitalize(name)
    {order: parts[0] , name: name , articles: [] , path: path}

  @fileNameToObject: (name , path) ->
    parts = name.split("_")
    name = parts[1].split(".")[0]
    name = name.replace("-" , " ")
    name = @capitalize(name)
    path = path.split(".")[0].replace("views/", "")
    {order: parts[0] , name: name , path: path }

module.exports = (grunt) ->
  
  fs = require("fs")
  npath = require("path")

  # Please see the Grunt documentation for more information regarding task
  # creation: http://gruntjs.com/creating-tasks
  grunt.registerMultiTask "articles", "Your task description goes here.", ->

    directories = []
    path = @options().src
    for dir in fs.readdirSync(path)
      fullPath = npath.join(path, dir)
      directory = Articles.dirNameToObject(dir, fullPath)
      for file in fs.readdirSync(fullPath)
        filePath = npath.join(fullPath ,file)
        directory.articles.push Articles.fileNameToObject(file, filePath)
      directories.push directory

    grunt.file.write @options().dest , '{"categories":' + JSON.stringify(directories) + '}'
