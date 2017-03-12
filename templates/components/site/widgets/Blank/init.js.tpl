module.exports = initWidget
import create from './view/widget'

function initWidget () {
  return { <%= camelName %>Widget: [ 'widgetFactory', init ] }
}

function init (serviceLocator, done) {
  serviceLocator.widgetFactory.register('<%= camelName %>', create)
  done()
}
