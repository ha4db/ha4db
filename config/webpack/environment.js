/* eslint-disable @typescript-eslint/no-var-requires */
const { environment } = require('@rails/webpacker')

const sassLoader = environment.loaders.get('sass')['use'].find(rule => rule['loader'] === 'sass-loader')
sassLoader.options = {
  ...sassLoader.options,
  implementation: require('dart-sass'),
  sassOptions: {
    fiber: require('fibers'),
    includePaths: ['./node_modules'],
  },
}
module.exports = environment
