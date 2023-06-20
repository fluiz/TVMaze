//
//  Episodes.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import Foundation
import SwiftUI

struct Episode: Codable, Identifiable {
    var id: Int
    var name: String
    var season: Int
    var number: Int
    var image: MazeImage?
    var summary: String?
}

extension Episode {
    static func mockArray() -> [Self] {
        [
            .init(
                id: 1656038,
                name: "The End's Beginning",
                season: 1,
                number: 1,
                image: MazeImage(
                    medium: "https://static.tvmaze.com/uploads/images/medium_landscape/232/580508.jpg",
                    original: "https://static.tvmaze.com/uploads/images/medium_landscape/232/580508.jpg"
                ),
                summary: "<p>Hostile townsfolk and a cunning mage greet Geralt in the town of Blaviken. Ciri finds her royal world upended when Nilfgaard sets its sights on Cintra.</p>"
            ),
            .init(
                id: 1665510,
                name: "Four Marks",
                season: 1,
                number: 2,
                image: MazeImage(
                    medium: "https://static.tvmaze.com/uploads/images/medium_landscape/232/580509.jpg",
                    original: "https://static.tvmaze.com/uploads/images/original_untouched/232/580509.jpg"
                ),
                summary: "<p>Bullied and neglected, Yennefer accidentally finds a means of escape. Geralt's hunt for a so-called devil goes to hell. Ciri seeks safety in numbers.</p>"
            ),
            .init(
                id: 2127791,
                name: "A Grain of Truth",
                season: 2,
                number: 1,
                image: MazeImage(
                    medium: "https://static.tvmaze.com/uploads/images/medium_landscape/384/960804.jpg",
                    original: "https://static.tvmaze.com/uploads/images/original_untouched/384/960804.jpg"
                ),
                summary: "<p>Geralt sets off with Ciri on a journey that leads him to an old friend. After the Battle of Sodden, Tissaia shows no mercy in her search for information.</p>"
            ),
            .init(
                id: 2534816,
                name: "Shaerrawedd",
                season: 3,
                number: 1,
                image: MazeImage(
                    medium: "https://static.tvmaze.com/uploads/images/medium_landscape/465/1163454.jpg",
                    original: "https://static.tvmaze.com/uploads/images/original_untouched/465/1163454.jpg"
                ),
                summary: nil
            ),
        ]
    }
}
