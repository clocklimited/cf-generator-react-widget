const compileJade = require('browjadify-compile')
const join = require('path').join
const template = compileJade(join(__dirname, '/../templates/form.jade'))
const BaseWidgetView = require('../../../widget/views/form/base')
const debug = require('../../../../../admin/source/js/lib/debug')('<%= camelName %> view')

module.exports = BaseWidgetView.extend({
  template: template,
  debug: debug
})
