import create from './view/widget'
<%
var factories = []
if (sectionWidget) factories.push('section')
if (bodyComponentWidget) factories.push('articleBody')
if (articleLayoutWidget) factories.push('article')
%>
const init = (serviceLocator, done) => {
  <%= `;[ '${factories.join('\', \'')}' ]` %>.forEach(factory =>
    serviceLocator.widgetFactories.get(factory).register('<%= camelName %>', create))

  done()
}

const initWidget = () => ({ <%= camelName %>Widget: [ <%= bodyComponentWidget && `'article', `%>'widget', init ] })

module.exports = initWidget
