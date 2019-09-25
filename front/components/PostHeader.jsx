import React from 'react';
import PropTypes from 'prop-types';

import showdown from 'showdown';

const PostHeader = ({ post: { title, body } }) => {
  const converter = new showdown.Converter();
  return (
    <>
      <div>{title}</div>
      <div dangerouslySetInnerHTML={{ __html: converter.makeHtml(body) }} />
    </>
  )
};

PostHeader.propTypes = {
  post: PropTypes.shape({
    title: PropTypes.string.isRequired,
    body: PropTypes.string.isRequired,
  }).isRequired,
};

export default PostHeader;
