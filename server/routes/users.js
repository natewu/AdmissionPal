var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.json([
    {id: 1, username: "hi"},
    {id: 2, username: "hi2"},
    {id: 3, username: "hi3"},
    {id: 4, username: "hi4"},
    {id: 5, username: "hi5"},
  ])
});

module.exports = router;
