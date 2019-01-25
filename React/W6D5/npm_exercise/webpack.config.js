module.exports = {
  entry: "./entry.jsx",
  output: {
    filename: "bundle.js",
  },
  module: {
    rules: [
      {
        test: [/\.jsx?$/, /\.js?$/],
        exclude: /(node_modules)/,
        loader: "babel-loader"
      }
    ]
  },
  devtool: "source-map",
  resolve: {
    extensions: [".js", ".jsx"]
  }
};