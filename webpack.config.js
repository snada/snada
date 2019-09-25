const path = require('path');

const moduleConfig = {
  rules: [
    {
      test: /\.(js|jsx)$/,
      exclude: /node_modules/,
      use: {
        loader: 'babel-loader',
      },
    },
    {
      test: /\.(gql|graphql)$/,
      exclude: /node_modules/,
      use: {
        loader: 'graphql-tag/loader',
      },
    },
  ],
};

const serverConfig = {
  mode: 'development',
  target: 'node',
  externals: {
    sequelize: 'commonjs sequelize',
    pg: 'commonjs pg',
    'pg-hstore': 'commonjs pg-hstore',
    config: 'commonjs config',
  },
  node: {
    __dirname: true,
  },
  entry: {
    server: './src/index.jsx',
  },
  output: {
    path: path.resolve(__dirname, 'dist/server'),
    filename: './bundle.js',
  },
  module: moduleConfig,
  resolve: {
    extensions: ['.mjs', '.js', '.jsx'],
  },
};

const clientConfig = {
  mode: 'development',
  target: 'web',
  entry: {
    front: './front/index.jsx',
  },
  output: {
    path: path.resolve(__dirname, 'dist/front'),
    filename: './bundle.js',
  },
  module: moduleConfig,
  resolve: {
    extensions: ['.mjs', '.js', '.jsx'],
  },
};

module.exports = [serverConfig, clientConfig];
