var path = require("path");

module.exports = {
  entry: {
    app: [
      'webpack-dev-server/client?http://0.0.0.0:3000', // WebpackDevServer host and port
      'webpack/hot/only-dev-server', // "only" prevents reload on syntax errors
      './index.js'
    ]
  },
  devServer: {
    port: 3000,
    historyApiFallback: {
      index: 'index.html'
    }
  },
  output: {
    path: path.resolve(__dirname + '/dist'),
    filename: '[name].js',
  },

  module: {
    loaders: [
      {
        test: /\.(css|scss)$/,
        loaders: [
          'style-loader',
          'css-loader',
        ]
      },
      {
        test:    /\.html$/,
        exclude: /node_modules/,
        loader:  'file?name=[name].[ext]',
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        include: path.join(__dirname, 'src'),
        loaders: ['elm-hot', 'elm-webpack']
      },
      {
        test: /\.(css)$/,
        loaders: [
          'style-loader',
          'css-loader',
        ]
      },
    ],
    noParse: /\.elm$/,
  },
};
