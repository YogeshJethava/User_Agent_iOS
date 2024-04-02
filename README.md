UserAgent an library written in Swift.

[![Swift](https://img.shields.io/badge/Swift-5.7_5.8_5.9-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.7_5.8_5.9-Orange?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)

- [Features](#features)
- [Installation](#installation)
- [Example](#example)


## Features
- [x] DarwinVersion
- [x] CFNetworkVersion
- [x] deviceVersion
- [x] deviceName
- [x] appNameAndVersion
- [x] UAString
                          
## Installation
                          
  ### Swift Package Manager

  The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

  Once you have your Swift package set up, adding Alamofire as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift` or the Package list in Xcode.

  ```swift
  dependencies: [
      .package(url: "https://github.com/YogeshJethava/User_Agent_iOS.git", .upToNextMajor(from: "1.0.0"))
  ]
  ```

  Normally you'll want to depend on the User_Agent_iOS target:

  ```swift
  .product(name: "UserAgent", package: "User_Agent_iOS")
  ```

## Example

```swift
let darwinVersion = UserAgentManager.shared.DarwinVersion()  //eg. Darwin/16.3.0
let cfNetworkVersion = UserAgentManager.shared.CFNetworkVersion()  //eg. CFNetwork/808.3
let deviceVersion = UserAgentManager.shared.deviceVersion()  //eg. iOS/10_1
let deviceName = UserAgentManager.shared.deviceName()  //eg. iPhone/15_Pro_Max
let appNameAndVersion = UserAgentManager.shared.appNameAndVersion()  //eg. MyApp/1
let uaString = UserAgentManager.shared.UAString()  //eg.  CFNetwork/808.3 Darwin/16.3.0 (iPhone/15_Pro_Max iOS/10_1)
```

