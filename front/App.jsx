import React from 'react';
import { Route, Switch } from 'react-router-dom';

import Home from './routes/Home';
import Posts from './routes/Posts';
import NewPost from './routes/posts/New';
import Profile from './routes/Profile';
import NotFound from './routes/NotFound';

const App = () => (
  <Switch>
    <Route exact path="/profile" component={Profile} />
    <Route exact path="/posts/new" component={NewPost} />
    <Route exact path="/posts" component={Posts} />
    <Route exact path="/" component={Home} />
    <Route component={NotFound} status={404} />
  </Switch>
);

export default App;
