//
//  Shows.swift
//  TvMaze
//
//  Created by Fabio Luiz on 17/06/23.
//

import Foundation

struct ShowItem: Codable, Identifiable {
    var id: Int
    var name: String
    var genres: [String]
    var summary: String?
    var schedule: Schedule
    var image: MazeImage?
}

struct Schedule: Codable {
    var time: String
    var days: [String]
}

struct ShowSearchResult: Codable {
    var show: ShowItem
}
