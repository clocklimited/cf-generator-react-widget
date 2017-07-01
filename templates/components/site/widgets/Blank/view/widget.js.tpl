import React from 'react'
import <%= nameNoSpace %>Widget from '../component/<%= nameNoSpace %>'

const create = (serviceLocator, widget, props, cb) => {
  cb(null, <<%= nameNoSpace %>Widget {...widget} />)
}

export default create
