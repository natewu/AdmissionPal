var express = require('express');
var router = express.Router();
var db = require("../backend/db.js");

/* GET users listing. */
router.get('/', function(req, res, next) {
  db.query("SELECT * FROM majors", (err, results, fields) => {
    !err ? res.json(results) : res.json(err);
  });
});
router.get('/types', function(req, res, next) {
  db.query("SELECT * FROM major_names", (err, results, fields) => {
    !err ? res.json(results) : res.json(err);
  });
});

module.exports = router;
