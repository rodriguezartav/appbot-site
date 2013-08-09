(function() {
  var Processor, assert, should;

  assert = require("assert");

  should = require("should");

  Processor = require(process.cwd() + "/processor");

  describe("Compile JS from paths", function() {
    it("should compile just touch resources", function() {
      var str;
      str = Compiler.generateFile(maps["mobile"].appPaths, maps["mobile"].dependencyPaths);
      return str.indexOf("controllers/main").should.not.be.equal(-1);
    });
    it("should compile css resources", function() {
      var str;
      str = Compiler.generateFile(maps["mobile"].appPaths, maps["mobile"].dependencyPaths);
      return str.indexOf('var css=""').should.be.equal(-1);
    });
    return it("should compile just socialBar", function() {
      var str;
      str = Compiler.generateFile(maps["socialBar"].appPaths, maps["socialBar"].dependencyPaths);
      return str.indexOf("components/socialBar/").should.not.be.equal(-1);
    });
  });

}).call(this);
