import { GraphQLObjectType, GraphQLList } from 'graphql';

import Models from '../models';

import postType from './types/postType';

export default new GraphQLObjectType({
  name: 'RootQueryType',
  fields: {
    posts: {
      type: new GraphQLList(postType),
      resolve: () => Models.Post.findAll(),
    },
    // me: {
    //   name: "me",
    //   type: userType,
    //   resolve: (_parentValue, _args, request) => {
    //     return request.user;
    //   }
    // }
  },
});
