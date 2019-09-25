import React, { useState } from 'react';
import { Helmet } from 'react-helmet';

import showdown from 'showdown';

const New = () => {
  const [body, setBody] = useState('');

  const converter = new showdown.Converter();

  return (
    <>
      <Helmet>
        <title>New Post - snada</title>
      </Helmet>
      <br />
      <textarea value={body} onChange={(event) => setBody(event.target.value)} />
      <div dangerouslySetInnerHTML={{ __html: converter.makeHtml(body) }} />
    </>
  );
};

export default New;
