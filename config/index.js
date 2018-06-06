let config = require('./app.json')
if (process.env.NODE_ENV === 'development') {
  config = require('./app.server.json')
}

module.exports = config
