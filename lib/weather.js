const https = require('https')
const config = require('../config')
const querystring = require('querystring')

module.exports = {
  filterWeatherText: (data) => {
    if (!data || !data.results || !data.results.length) {
      return '天气获取失败'
    }
    const location = data.results[0].location.name
    const text = data.results[0].now.text
    const temperature = data.results[0].now.temperature

    return `${location} - ${text} - ${temperature}`
  },
  buildQuery: (city) => {
    const params = {
      location: city,
      key: config.weather.key,
      language: 'zh-Hans',
      unit: 'c',
    }
    const queryStr = querystring.stringify(params)
    return `${config.weather.api}?${queryStr}`
  },
  query: (city, callback) => {
    const params = {
      location: city,
      key: config.weather.key,
      language: 'zh-Hans',
      unit: 'c',
    }
    const queryStr = querystring.stringify(params)

    https.get(`${config.weather.api}?${queryStr}`, (resp) => {
      let data = '';

      // A chunk of data has been recieved.
      resp.on('data', (chunk) => {
        data += chunk;
      });

      // The whole response has been received. Print out the result.
      resp.on('end', () => {
        callback(data)
        // console.log(JSON.parse(data).explanation);
      });

    }).on("error", (err) => {
      console.log("Error: " + err.message);
    });
  }
}

