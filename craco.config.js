// const CracoLessPlugin = require("craco-less");
const path = require("path");

module.exports = {
  eslint: {
    enable: false
  },
  webpack: {
    alias: {
      "@": path.resolve(__dirname, "src/")
    }
  },
  plugins: []
};
