var crypto = require('crypto')

module.exports = {
  sha1: () => {
    return 'sha1=' + crypto.createHmac('sha1', 'SECRET').update(post_body).digest('hex')
  },
  md5: (text) => {
    return crypto.createHash('md5').update(text).digest('hex')
  }
}
