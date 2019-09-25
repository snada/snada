import fs from 'fs';

import React from 'react';

import { StaticRouter } from 'react-router-dom';

import express from 'express';
import graphqlHTTP from 'express-graphql';

import Helmet from 'react-helmet';

import ApolloClient from 'apollo-client';
import { ApolloProvider } from '@apollo/react-common';
import { renderToStringWithData } from '@apollo/react-ssr';
import { SchemaLink } from 'apollo-link-schema';
import { InMemoryCache } from 'apollo-cache-inmemory';

import schema from '../graphql/schema';

import App from '../front/App';

const app = express();
const port = 1337;

const page = fs.readFileSync('./dist/front/index.html', 'UTF-8');

app.use('/graphql', graphqlHTTP({
  schema,
  graphiql: process.env.NODE_ENV === 'development',
}));

app.use(express.static('dist/front', { index: false }));

app.get('*', (req, res) => {
  const client = new ApolloClient({
    ssrMode: true,
    link: new SchemaLink({ schema }),
    cache: new InMemoryCache(),
  });

  const context = {};
  renderToStringWithData(
    <ApolloProvider client={client}>
      <StaticRouter location={req.url} context={context}>
        <App />
      </StaticRouter>
    </ApolloProvider>,
  ).then((rendered) => {
    if (context.url) {
      return res.redirect(context.url);
    }
    if (context.status) {
      res.status(context.status);
    }

    const helmet = Helmet.renderStatic();

    let hydratedPage = page.replace(
      '<div id="app"></div>',
      `<div id="app">${rendered}</div>`,
    );

    hydratedPage = hydratedPage.replace(
      '<script id="state"></script>',
      `<script id="state">window.STATE = '${Buffer.from(JSON.stringify(client.extract())).toString('base64')}'</script>`,
    );

    hydratedPage = hydratedPage.replace(
      '<title>Example</title>',
      helmet.title.toString(),
    );
    res.set('Content-Type', 'text/html');

    return res.send(hydratedPage);
  }).catch((err) => {
    res.status(500);
    return res.send(`Error! ${err}`);
  });
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));

export default app;
