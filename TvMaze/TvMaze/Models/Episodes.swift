//
//  Episodes.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import Foundation

struct Episode: Codable, Identifiable {
    var id: Int
    var name: String
    var season: Int
    var number: Int
    var image: MazeImage?
    var summary: String?
    
    func seasonalNumber() -> String {
        return "S\(season)E\(number)"
    }
}
