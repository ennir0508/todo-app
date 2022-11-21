/* eslint-disable jsdoc/require-jsdoc */
module.exports = function (api) {
  api.cache(true);
  return {
    presets: ['babel-preset-expo'],
  };
};
