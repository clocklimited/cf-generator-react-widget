const FormView = require('./views/form')
const Model = require('./models/model')
const ItemView = require('../../widget/views/item/edit-base')

const init = (serviceLocator, done) => {
  const widget = {
    editView: FormView,
    model: Model,
    itemView: ItemView,
    name: '<%= name %>',
    description: '<%= description %>'
  }
<%
var factories = []
if (sectionWidget) factories.push('section')
if (bodyComponentWidget) factories.push('articleBody')
if (articleLayoutWidget) factories.push('article')
%>
  <%= `[ '${factories.join('\', \'')}' ]` %>.forEach(factory =>
    serviceLocator.widgetFactories.get(factory).register('<%= camelName %>', widget))

  done()
}

const initWidget = () => ({ <%= camelName %>Widget: init })

module.exports = initWidget
