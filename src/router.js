const express = require('express');
const fs = require('fs');
const path = require('path');
const router = express.Router();

// Generic GET endpoint for the app
router.get('/', function(req, res) {
  res.render('index');
});

// Fake "API" endpoint that returns the data
router.post('/data', function(req, res) {
  res.send(fs.readFileSync(path.join(__dirname, '/data.json')));
});

module.exports = router;
