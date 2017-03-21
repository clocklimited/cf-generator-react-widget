module.exports = NodeProjectGenerator

const  kickoff = require('kickoff')
const Generator = kickoff.Generator
const generate = kickoff.generate
const camelcase = require('lodash.camelcase')
const renameSync = require('fs').renameSync
const join = require('path').join
const mkdirp = require('mkdirp').sync

function required (value) {
  return !!value
}

function NodeProjectGenerator () {
  Generator.call(this)
}

NodeProjectGenerator.prototype = Object.create(Generator.prototype)

NodeProjectGenerator.prototype.prompts =
[ {
    name: 'name',
    message: 'Name of this widget',
    validate: required,
    default: 'Hoozit'
  },
  {
      name: 'description',
      message: 'Short description of this widget',
      validate: required
  },
  {
      name: 'path',
      message: 'Path of widgets',
      validate: required,
      default: './components/site/widgets'
  },
  {
      name: 'adminPath',
      message: 'Admin Path of widgets',
      validate: required,
      default: './components/admin/widgets'
  },
  {
      name: 'sectionWidget',
      message: 'Can this be added to Sections',
      validate: required,
      default: true
  },
  {
      name: 'bodyComponentWidget',
      message: 'Can this be added to an Articles Body',
      validate: required,
      default: false
  },
  {
      name: 'articleLayoutWidget',
      message: 'Can this be added to an Articles Layout',
      validate: required,
      default: false
  }
]

NodeProjectGenerator.prototype._generate = function (path, config, cb) {
  config.camelName = camelcase(config.name)
  config.nameNoSpace = config.name.replace(/\s/g, '')
  config.filename = config.name.toLowerCase().replace(/\s/g, '-')
  generate(__dirname, path, config, (err) => {
    if (err) return cb(err)
    try {
      renameSync(join(path, config.path, 'Blank'), join(path, config.path, config.filename))
      renameSync(join(path, config.adminPath, 'blank'), join(path, config.adminPath, config.filename))
    } catch (e) {
      console.error(e)
    }
    renameSync(join(path, config.path, config.filename, 'component', 'Blank.js'),
      join(path, config.path, config.filename, 'component', `${config.nameNoSpace}.js`))
    renameSync(join(path, config.path, config.filename, 'component/test', 'Blank.test.js'),
      join(path, config.path, config.filename, 'component/test', `${config.nameNoSpace}.test.js`))
    cb()
  })
}
