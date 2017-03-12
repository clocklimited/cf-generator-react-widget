import React from 'react'
import assert from 'assert'
import { shallow } from 'enzyme'
import <%= nameNoSpace %>Widget from '../component/<%= nameNoSpace %>'

const widgetProps =
  { displayOptions: [ 'desktop', 'tablet', 'mobile' ],
    id: 'abc'
  }

describe('<%= nameNoSpace %> Widget', function () {
  it('should extend the default widget component', function () {
    const wrapper = shallow(<<%= nameNoSpace %>Widget {...widgetProps} />)
    assert.equal(wrapper.name(), 'WidgetWrapper')
  })

  it('should populate the content block of the default widget component', function () {
    const wrapper = shallow(<<%= nameNoSpace %>Widget {...widgetProps} />)
    assert.equal(wrapper.find('.widget').hasClass('widget--<%= filename %>'), true)
  })
})
