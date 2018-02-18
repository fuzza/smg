// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "smg",
  products: [
    .executable(name: "smg", targets: ["SMG"])
  ],
  dependencies: [
    .package(url: "https://github.com/kylef/Commander.git", from: "0.8.0"),
    // Need to wait for release next by 0.10.1 to resolve Spectre version incompatibility between Commander and Stencil
    .package(url: "https://github.com/kylef/Stencil.git", .revision("fa68ba9df84dcd7b21febcdb0ab7ef067f839ea1")),
    .package(url: "https://github.com/xcodeswift/xcproj.git", from: "4.0.0"),
    .package(url: "https://github.com/jpsim/Yams.git", from: "0.5.0")
  ],
  targets: [
    .target(name: "SMG",
            dependencies: ["SMGCore", "Commander"]),
    .target(name: "SMGCore",
            dependencies: ["Stencil", "xcproj", "Yams"]),
    .testTarget(name: "SMGTests",
                dependencies: ["SMGCore", "Yams"])
  ]
)