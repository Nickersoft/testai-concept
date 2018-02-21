const express = require('express');
const path = require('path');
const harp = require('harp');
const helmet = require('helmet');

const router = require('./router');
const app = express();

// Initialize view engine (Pug)
app.set('views', path.join(__dirname, '/views'));
app.set('view engine', 'pug');

// Add some security
app.use(helmet());

// Apply Harp middleware (this allows us to transpile SASS and CoffeeScript at runtime)
app.use(harp.mount(__dirname + '/public'));

// Apply routing
app.use(router);

// Start server
app.listen(3000, function(err) {
  if (err) console.error(err);
  console.log('Server listening on port 3000.');
});
