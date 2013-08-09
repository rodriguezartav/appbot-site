assert = require("assert")

should = require("should")

Processor = require(process.cwd() + "/processor")

describe "Compile JS from paths" , ->

  it "should compile just touch resources" , ->
     str = Compiler.generateFile(maps["mobile"].appPaths , maps["mobile"].dependencyPaths)
     str.indexOf("controllers/main").should.not.be.equal(-1)

   it "should compile css resources" , ->
      str = Compiler.generateFile(maps["mobile"].appPaths , maps["mobile"].dependencyPaths)
      str.indexOf('var css=""').should.be.equal(-1)

  it "should compile just socialBar" , ->
    str = Compiler.generateFile(maps["socialBar"].appPaths , maps["socialBar"].dependencyPaths)
    str.indexOf("components/socialBar/").should.not.be.equal(-1)
     
     
