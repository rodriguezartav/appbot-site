
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('index', {} );
};


exports.views = function(req, res){
  console.log(req.params.page)
  res.render(req.params.page, {} );
};