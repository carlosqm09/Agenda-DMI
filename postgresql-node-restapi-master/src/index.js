const express = require('express');

const app = express();

// middlewares
app.use(express.json());
app.use(express.urlencoded({extended: false}));

var server_port = process.env.YOUR_PORT || process.env.PORT || 80;
var server_host = process.env.YOUR_HOST || '0.0.0.0';

// Routes
app.use(require('./routes/index'));

app.listen(server_port, server_host, function() {
    console.log('Listening on port %d', server_port);
  });
