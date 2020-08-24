/* eslint-disable @typescript-eslint/no-var-requires */
process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()
