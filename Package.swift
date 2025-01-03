// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "BearAnimation",
    platforms: [
        .iOS(.v16),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "BearAnimation",
            targets: ["BearAnimation"]
        )
    ],
    dependencies: [
//        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.4")
    ],
    targets: [
        .target(
            name: "BearAnimation"
//            dependencies: ["Alamofire"]
        ),
        .testTarget(
            name: "BearAnimationTests",
            dependencies: ["BearAnimation"]
        )
    ]
)
