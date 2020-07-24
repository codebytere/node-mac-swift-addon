This repository constitutes a proof of concept for a Node.js native addon which allows for writing functionality in Swift and exposing it to JavaScript. 

## To Use

You should be able to run the contents of this repository out of the box, although there are a few small workarounds explained below which you'll have to perform in order to get things working as expected.

```sh
# Clone down the repository.
$ git clone https://github.com/codebytere/node-mac-swift-addon

# Change into the addon directory.
$ cd node-mac-swift-addon

# Install dependencies but ignore scripts, because node-gyp runs `node-gyp rebuild` 
# as a postinstall script and will not invoke my patched version.
$ npm install --ignore-scripts

# Run my patched version of node-gyp, passing the ninja flag.
$ ./node_modules/.bin/node-gyp rebuild --ninja

# This renames the shared library to give it the .node extension
# necessary to be able to require and use it in Node.js.
$ npm run move-target

# Run my minimal JavaScript sample.
$ node index.js
```

## Why? How? 

This is possible as a result of patches to `node-gyp` I added in [this commit](https://github.com/codebytere/node-gyp/commit/e55dc9ba27f9b52f3062a08f2b83e3aa353de2b8).

`node-gyp` is a cross-platform command-line tool for compiling native addon modules for Node.js. Out of the gate, it's capable of handling C, C++, and Objective-C++ amongst others, although those three are what you'd typically use to create a native Node.js addon with [Nan](https://github.com/nodejs/nan) or [node-addon-api](https://github.com/nodejs/node-addon-api).

After Apple announced Big Sur at the 2020 edition of WWDC, I poked around at some of the upcoming APIs that would be made available to developers, and discovered to my chagrin that they would only be made available as Swift APIs, and not have dual Objective-C and Swift support as most Apple APIs for macOS do.

For example, it would be great to be able to access something like [WidgetKit](https://developer.apple.com/documentation/widgetkit/) in Electron apps via addon, but since it's Swift-only, that's not currently possible.

In order for a native node addon to work properly in Node.js, the compiled addon product must be a [shared library](https://www.geeksforgeeks.org/working-with-shared-libraries-set-1/). For the last ~year or so Apple has enabled the creation of Mix and Match frameworks with Swift and Objective-C both, and this gave me the idea that I could potentially leverage and mimic this compilation pipeline to generate a shared library file I could then expose into Node.js. After some trial and error I was able to recreate the commands that Xcode runs to generate shared libraries, which culminated in the ability to run the addon contained within this repository.

