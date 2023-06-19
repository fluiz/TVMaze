//
//  People.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import Foundation

struct Person: Codable, Identifiable {
    var id: Int
    var name: String
    var image: MazeImage?
}

struct PeopleSearchResult: Codable {
    var person: Person
}

struct CreditResult: Codable {
    var credit: EmbeddedShow
    
    private enum CodingKeys: String, CodingKey {
        case credit = "_embedded"
    }
}

struct EmbeddedShow: Codable {
    var show: ShowItem
}

extension Person {
    static func mockArray() -> [Self] {
        [
            .init(id: 40099, name: "Henry Cavill", image: MazeImage(medium: "https://static.tvmaze.com/uploads/images/medium_portrait/458/1145126.jpg", original: "https://static.tvmaze.com/uploads/images/original_untouched/458/1145126.jpg")),
            .init(id: 114411, name: "Kate Beckinsale", image: MazeImage(medium: "https://static.tvmaze.com/uploads/images/medium_portrait/40/102446.jpg", original: "https://static.tvmaze.com/uploads/images/original_untouched/40/102446.jpg")),
            .init(id: 672, name: "Matthew McConaughey", image: MazeImage(medium: "https://static.tvmaze.com/uploads/images/medium_portrait/3/8927.jpg", original: "https://static.tvmaze.com/uploads/images/original_untouched/3/8927.jpg")),
            .init(id: 76510, name: "Sienna Miller", image: MazeImage(medium: "https://static.tvmaze.com/uploads/images/medium_portrait/26/65660.jpg", original: "https://static.tvmaze.com/uploads/images/original_untouched/26/65660.jpg"))
        ]
    }
}
