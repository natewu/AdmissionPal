var express = require('express');
var router = express.Router();
var db = require("../backend/db.js");

/* GET users listing. */
router.get('/', function(req, res, next) {
  // db.query("SELECT * FROM universities", (err, results, fields) => {
  //   !err ? res.json(results) : res.json(err);
  // });
  // res.header("Access-Control-Allow-Origin", "*");
  // res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  // res.render('index', { title: 'post' }. req);

  var majorid_list = JSON.parse(req.query.major)
  var uniid_list = JSON.parse(req.query.uni)
  var query = 'SELECT (@cnt := @cnt + 1) AS id, majors.*, universities.*, major_names.* FROM majors CROSS JOIN (SELECT @cnt := 0) AS dummy INNER JOIN universities ON universities.uni_id=majors.uni_id INNER JOIN major_names ON major_names.name_id=majors.name_id WHERE majors.name_id IN (?) AND majors.uni_id IN (?)';
  db.query(query, [majorid_list, uniid_list], (err, results) => {
    !err ? res.send(results) : res.json(err);
  })

  // res.send(JSON.parse(req.query.uni))
});

module.exports = router;
