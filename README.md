[![Build Status](https://travis-ci.org/luckymarmot/Paw-ObjCAFNetworkingCodeGenerator.svg?branch=master)](https://travis-ci.org/luckymarmot/Paw-ObjCAFNetworkingCodeGenerator)

# Objective-C + AFNetworking Code Generator (Paw Extension)

A [Paw Extension](http://luckymarmot.com/paw/extensions/) that generates Objective-C code for the [AFNetworking 2.0](http://afnetworking.com) library.

## Installation

Easily install this Paw Extension: [Install Objective-C + AFNetworking Code Generator](http://luckymarmot.com/paw/extensions/ObjCAFNetworkingCodeGenerator)

## Development

### Build & Install

```shell
npm install
cake build
cake install
```

### Watch

During development, watch for changes:

```shell
cake watch
```

### Tests

#### Podfile

An Xcode Project is present in the `/test` folder.

```shell
pod install
```

#### Build

```shell
set -o pipefail && xcodebuild -workspace 'ObjCAFNetworkingCodeGeneratorTest/ObjCAFNetworkingCodeGenerator.xcworkspace' -scheme ObjCAFNetworkingCodeGenerator clean build | xcpretty -c
```

## License

This Paw Extension is released under the [MIT License](LICENSE). Feel free to fork, and modify!

Copyright © 2014 Paw Inc.

## Contributors

See [Contributors](https://github.com/luckymarmot/Paw-ObjCAFNetworkingCodeGenerator/graphs/contributors).

## Credits

* [Mustache.js](https://github.com/janl/mustache.js/), also released under the MIT License
* [URI.js](http://medialize.github.io/URI.js/), also released under the MIT License
