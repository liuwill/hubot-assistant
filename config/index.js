let config = require('./app.json')
if (process.env.NODE_ENV === 'development') {
  config = require('./app.server.json')
} else if (process.env.NODE_ENV === 'production') {
  config = require('./app.production.json')
}

module.exports = config
