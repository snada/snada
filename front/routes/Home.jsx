import React, { useState } from 'react';
import { Helmet } from 'react-helmet';

import { Link } from 'react-router-dom';

const Home = () => {
  const [counter, setCounter] = useState(0);

  return (
    <div>
      <Helmet>
        <title>Homepage - snada</title>
      </Helmet>
      {`Counter is: ${counter}`}
      <br />
      <button type="button" onClick={() => setCounter(counter + 1)}>
        Clickme
      </button>
      <Link to="/profile">Click me!</Link>
      <br />
      <Link to="/posts">Go to posts!</Link>
    </div>
  );
};

export default Home;
