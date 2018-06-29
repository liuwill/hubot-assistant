const fs = require('fs')
const path = require('path')

let config = {}
const defaultConfigPath = './app.json'
let configPath = defaultConfigPath
if (process.env.NODE_ENV === 'development') {
  configPath = './app.server.json'
} else if (process.env.NODE_ENV === 'production') {
  configPath = './app.production.json'
}

try {
  fs.accessSync(configPath, fs.constants.R_OK)
  config = require(configPath)
} catch (err) {
  console.log('config not exist')
}

module.exports = config
