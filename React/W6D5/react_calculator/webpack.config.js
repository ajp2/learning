module.exports = {
  entry: "./app.jsx",
  output: {
    filename: "./bundle.js"
  },
  module: {
    rules: [
      {
        test: [/\.jsx?$/, /\.js?$/],
        exclude: /(node_modules)/,
        loader: "babel-loader",
        query: {
          presets: ["@babel/env", "@babel/react"]
        }
      }
    ]
  },
  devtool: "source-map",
  resolve: {
    extensions: [".js", ".jsx", "*"]
  }
};