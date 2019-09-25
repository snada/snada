import { GraphQLObjectType } from 'graphql';
import createPost from './mutations/createPost';

export default new GraphQLObjectType({
  name: 'RootMutationType',
  fields: {
    createPost,
  },
});
