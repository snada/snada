import React from 'react';
import { Helmet } from 'react-helmet';

import { useQuery } from '@apollo/react-hooks';

import PostHeader from '../../components/PostHeader';

import POSTS from '../../queries/posts.gql';

const Posts = () => {
  const { loading, error, data } = useQuery(POSTS);

  return (
    <>
      <Helmet>
        <title>Posts - snada</title>
      </Helmet>
      <br />
      {
        data ? data.posts.map((post) => (
          <PostHeader
            key={post.slug}
            post={post}
          />
        )) : 'loading...'
      }
    </>
  );
};

export default Posts;
