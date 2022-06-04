// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "UtilityComponents",
  platforms: [
    .iOS(.v15),
    .macOS(.v12),
  ],
  products: [
    .library(name: "SecureStorage", targets: ["SecureStorage"]),
    .library(name: "Vita", targets: ["Vita"]),
    .library(name: "XCGWrapper", targets: ["XCGWrapper"]),
    .library(name: "Shared", targets: ["Shared"]),
  ],
  dependencies: [
    .package(url: "https://github.com/DaveWoodCom/XCGLogger.git", from: "7.0.1"),
//    .package(url: "https://github.com/K3TZR/SharedComponents.git", from: "4.0.1"),
    .package(url: "https://github.com/pointfreeco/swift-identified-collections", from: "0.3.2"),
  ],
  targets: [
    // --------------- Modules ---------------
    // Shared
    .target( name: "Shared", dependencies: [
      .product(name: "IdentifiedCollections", package: "swift-identified-collections"),
    ]),

    // SecureStorage
    .target( name: "SecureStorage", dependencies: []),

    // Vita
    .target(
      name: "Vita",
      dependencies: [
        .product(name: "IdentifiedCollections", package: "swift-identified-collections"),
      ]),
    
    // XCGWrapper
    .target( name: "XCGWrapper", dependencies: [
      "Shared",
      .product(name: "XCGLogger", package: "XCGLogger"),
      .product(name: "ObjcExceptionBridging", package: "XCGLogger"),
    ]),

    // ---------------- Tests ----------------
    // SharedTests
    .testTarget(name: "SharedTests", dependencies: ["Shared"]),

    // SecureStorageTests
    .testTarget(name: "SecureStorageTests", dependencies: ["SecureStorage"]),

    // VitaTests
    .testTarget(name: "VitaTests", dependencies: ["Vita"]),

    // XCGWrapperTests
    .testTarget(name: "XCGWrapperTests", dependencies: ["XCGWrapper"]),
  ]
)
