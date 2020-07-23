To Use:
```sh
$ git clone https://github.com/codebytere/node-mac-swift-addon
$ cd node-mac-swift-addon
$ npm install  --ignore-scripts
$ ./node_modules/.bin/node-gyp rebuild --ninja
$ npm run move-target
$ node index.js
```

This is possible as a result of patches to `node-gyp` added in [this commit](https://github.com/codebytere/node-gyp/commit/aaf533f733cba374303e28fe152a6ef56c987b1d).

There will be better docs for this soon. Promise.
