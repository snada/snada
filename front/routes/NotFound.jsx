import React from 'react';
import PropTypes from 'prop-types';

const NotFound = ({ staticContext }) => {
  if (staticContext) { staticContext.status = 404; }

  return (
    <div>
      404 Not found
    </div>
  );
};

NotFound.propTypes = {
  staticContext: PropTypes.shape({
    status: PropTypes.number,
  }),
};

NotFound.defaultProps = {
  staticContext: null,
};

export default NotFound;
