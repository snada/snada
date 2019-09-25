import { GraphQLString, GraphQLNonNull } from 'graphql';
import postType from '../types/postType';
import { Post } from '../../models';

export default {
  type: postType,
  args: {
    slug: {
      type: GraphQLNonNull(GraphQLString),
    },
    title: {
      type: GraphQLNonNull(GraphQLString),
    },
    description: {
      type: GraphQLNonNull(GraphQLString),
    },
    body: {
      type: GraphQLNonNull(GraphQLString),
    },
  },
  resolve: (root, params) => Post.create(params),
};
