// swift-tools-version:5.3

import PackageDescription

let package = Package(

  name: "SnapshotTestingEx",

  platforms: [
    .macOS(.v10_10),
    .iOS(.v11),
    .tvOS(.v10)
  ],

  products: [
    .library(
      name: "SnapshotTestingEx",
      targets: ["SnapshotTestingEx"]
    ),
  ],

  dependencies: [
    .package(url: "https://github.com/kubacizek/SnapshotTesting.git", .branch("fix/wait"))
  ],

  targets: [
    .target(
      name: "SnapshotTestingEx",
      dependencies: ["SnapshotTesting", "SnapshotTestingExObjC"]
    ),
    .target(
      name: "SnapshotTestingExObjC",
      dependencies: []
    ),
    .testTarget(
      name: "SnapshotTestingExTests",
      dependencies: ["SnapshotTestingEx"],
      exclude: ["__Snapshots__"]
    )
  ]
)
