(function() {
  "use strict";
  var Articles;

  Articles = (function() {
    function Articles() {}

    Articles.capitalize = function(s) {
      return s.toLowerCase().replace(/\b./g, function(a) {
        return a.toUpperCase();
      });
    };

    Articles.dirNameToObject = function(name, path) {
      var parts;
      parts = name.split("_");
      name = parts[1];
      name = name.replace("-", " ");
      name = this.capitalize(name);
      return {
        order: parts[0],
        name: name,
        articles: [],
        path: path
      };
    };

    Articles.fileNameToObject = function(name, path) {
      var parts;
      parts = name.split("_");
      name = parts[1].split(".")[0];
      name = name.replace("-", " ");
      name = this.capitalize(name);
      path = path.split(".")[0].replace("views/", "");
      return {
        order: parts[0],
        name: name,
        path: path
      };
    };

    return Articles;

  })();

  module.exports = function(grunt) {
    var fs, npath;
    fs = require("fs");
    npath = require("path");
    return grunt.registerMultiTask("articles", "Your task description goes here.", function() {
      var dir, directories, directory, file, filePath, fullPath, path, _i, _j, _len, _len1, _ref, _ref1;
      directories = [];
      path = this.options().src;
      _ref = fs.readdirSync(path);
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        dir = _ref[_i];
        fullPath = npath.join(path, dir);
        directory = Articles.dirNameToObject(dir, fullPath);
        _ref1 = fs.readdirSync(fullPath);
        for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
          file = _ref1[_j];
          filePath = npath.join(fullPath, file);
          directory.articles.push(Articles.fileNameToObject(file, filePath));
        }
        directories.push(directory);
      }
      return grunt.file.write(this.options().dest, '{"categories":' + JSON.stringify(directories) + '}');
    });
  };

}).call(this);
