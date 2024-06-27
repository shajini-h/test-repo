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
  plugins: [
    // {
    //   plugin: CracoLessPlugin,
    //   options: {
    //     lessLoaderOptions: {
    //       lessOptions: {
    //         modifyVars: {
    //           "@primary-color": "#038fde"
    //         },
    //         javascriptEnabled: true
    //       }
    //     },
    //     modifyLessRule: (lessRule, context) => {
    //       lessRule.use = lessRule.use.filter(
    //         i => !i.loader.includes("resolve-url-loader")
    //       );
    //       return lessRule;
    //     }
    //   }
    // }
  ]
};
