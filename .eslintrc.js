module.exports = {
    parser: '@babel/eslint-parser',
    parserOptions: {
      ecmaVersion: 2020,
      sourceType: 'module',
      requireConfigFile: false,
    },
    env: {
      browser: true,
      commonjs: true,
      es6: true,
      node: true
    },
    extends: [
      "eslint:recommended", 
      'plugin:import/errors',
      'plugin:import/warnings',
      'plugin:import/typescript',
      "plugin:react/recommended"
    ],
    parserOptions: {
      ecmaFeatures: {
        experimentalObjectRestSpread: true,
        jsx: true
      },
      sourceType: "module"
    },
    plugins: ["react", "import"],
    rules: {
      "react/jsx-uses-vars": "error",
      "import/no-unresolved": "error",
      "no-unused-vars": "error",
      "no-console": "off",
      "react/prop-types": "off",
      "react/display-name": "off",
      "react/jsx-no-undef":"error"
    },
    settings: {
      "import/resolver": {
        node: {
          paths: ["src"]
        }
      }
    }
  };
  