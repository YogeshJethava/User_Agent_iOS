UserAgent an library written in Swift.

[[!Swift](https://img.shields.io/badge/Swift-5.7_5.8_5.9-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.7_5.8_5.9-Orange?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)

- [Features](#features)
- [Installation](#installation)


## Features
- [x] DarwinVersion
- [x] CFNetworkVersion
- [x] deviceVersion
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
