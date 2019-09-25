export default (sequelize, DataTypes) => {
  const Post = sequelize.define(
    'Post',
    {
      slug: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      title: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      description: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      body: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      createdAt: {
        type: DataTypes.DATE,
        allowNull: false,
        field: 'created_at',
      },
      updatedAt: {
        type: DataTypes.DATE,
        allowNull: false,
        field: 'updated_at',
      },
    },
    {
      tableName: 'posts',
      freezeTableName: true,
    },
  );
  Post.associate = () => {
    // eslint-disable-line no-unused-vars
    // associations can be defined here
  };
  return Post;
};
