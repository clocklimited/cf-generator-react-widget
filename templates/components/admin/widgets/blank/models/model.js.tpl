const BaseModel = require('cf-base-model')
const schemata = require('../../../../service/widget/model/base-widget')()
const validateDelegate = require('../../../../../admin/source/js/lib/validate-delegate')()

module.exports = BaseModel.extend({
  schemata: schemata,

  defaults () {
    return schemata.makeDefault({ type: this.type || '<%= camelName %>' })
  },

  validate: validateDelegate
})
