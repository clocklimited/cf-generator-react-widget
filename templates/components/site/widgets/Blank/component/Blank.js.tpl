import React from 'react'
import WidgetWrapper from '../../../widget/component/WidgetWrapper'

const <%= nameNoSpace %>Widget = (props) => {
  return (
    <WidgetWrapper {...props}>
      <div className="widget widget--<%= filename %>">
        <p>Widget content goes here</p>
      </div>
    </WidgetWrapper>
  )
}

<%= nameNoSpace %>Widget.propTypes = {
}

export default <%= nameNoSpace %>Widget
