module.exports = initWidget

function initWidget () {
  return { <%= camelName %>Widget: init }
}

function init (serviceLocator, done) {
  var widget =
    { editView: require('./views/form'),
      model: require('./models/model'),
      itemView: require('../../widget/views/item/edit-base'),
      name: '<%= name %>',
      description: '<%= description %>'
    }

<%= sectionWidget && `  serviceLocator.widgetFactory.register('${camelName}', widget)\n`
%><%= bodyComponentWidget && `  serviceLocator.bodyComponentWidgetFactory.register('${camelName}', widget)\n`
%><%= articleLayoutWidget && `  serviceLocator.articleLayoutWidgetFactory.register('${camelName}', widget)\n` %>
  done()
}
