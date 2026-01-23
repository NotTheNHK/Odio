// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
  name: "Odio",
  platforms: [
    .iOS(.v14),
    .macOS(.v11),
  ],
  products: [
    .library(
      name: "Odio",
      targets: ["Odio"]),
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-syntax.git", exact: "602.0.0"),
  ],
  targets: [
    .target(
      name: "Odio",
      swiftSettings: [
        .defaultIsolation(MainActor.self),
      ]),
  ],
  swiftLanguageModes: [
    .v6,
  ])
