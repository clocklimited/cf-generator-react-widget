module.exports = initWidget
import create from './view/widget'

function initWidget () {
  return { <%= camelName %>Widget: [ <%= bodyComponentWidget && `'article', `%>'widgetFactory', init ] }
}

function init (serviceLocator, done) {
<%= sectionWidget && `  serviceLocator.widgetFactory.register('${camelName}', create)\n`
%><%= bodyComponentWidget && `  serviceLocator.bodyComponentFactory.register('${camelName}', create)\n` %>
  done()
}
