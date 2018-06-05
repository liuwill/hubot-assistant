var crypto = require('crypto')

module.exports = {
  sha1: () => {
    return 'sha1=' + crypto.createHmac('sha1', 'SECRET').update(post_body).digest('hex')
  }
}
