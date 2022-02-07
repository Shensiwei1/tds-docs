#!/bin/sh

set -e

mkdir tmp
cp -r docs/sdk/_partials docs/sdk/16-engine tmp
rm -rf docs i18n versioned_docs versioned_sidebars versions.json
mkdir docs
mv tmp docs/sdk

cat<<END > sidebars.js
// @ts-check

/** @type {import('@docusaurus/plugin-content-docs').SidebarsConfig} */
const sidebars = {
  sdk: [
    {
      type: 'autogenerated',
      dirName: 'sdk',
    },
  ],
};

module.exports = sidebars;
END

BRAND=leancloud yarn build --out-dir build-leancloud

git clean -df
git checkout -f
