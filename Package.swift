// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "mob-deckofplayingcards",
    dependencies: [
        .Package(url: "https://github.com/lishuzhi1121/mob-playingcard", majorVersion: 1),
        .Package(url: "https://github.com/lishuzhi1121/mob-fisheryates", majorVersion: 1)
    ]
)
