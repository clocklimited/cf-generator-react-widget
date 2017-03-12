import React from 'react'
import <%= nameNoSpace %>Widget from '../component/<%= nameNoSpace %>'

function create (serviceLocator, req, section, article, widget, cb) {
  cb(null, <<%= nameNoSpace %>Widget {...widget} />)
}

export default create
