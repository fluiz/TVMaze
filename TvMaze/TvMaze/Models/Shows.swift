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

extension ShowItem {
    static func mockArray() -> [Self] {
        [
            .init(
                id: 42827,
                name: "The Sandman",
                genres: ["Drama", "Fantasy"],
                summary: "<p>A rich blend of modern myth and dark fantasy in which contemporary fiction, historical drama and legend are seamlessly interwoven, <b>The Sandman</b> follows the people and places affected by Morpheus, the Dream King, as he mends the cosmic — and human — mistakes he's made during his vast existence.</p>",
                schedule: Schedule(time: "", days: []),
                image: MazeImage(
                    medium: "https://static.tvmaze.com/uploads/images/medium_portrait/417/1042644.jpg",
                    original: "https://static.tvmaze.com/uploads/images/original_untouched/417/1042644.jpg"
                )
            ),
            .init(id: 40329, name: "Love, Death & Robots", genres: [
                "Horror",
                "Science-Fiction",
                "Thriller"
            ], schedule: Schedule(time: "22:00", days: ["Monday"]), image: MazeImage(
                medium: "https://static.tvmaze.com/uploads/images/medium_portrait/406/1016936.jpg",
                original: "https://static.tvmaze.com/uploads/images/original_untouched/406/1016936.jpg"
            )),
            .init(id: 305, name: "Black Mirror", genres: [
                "Drama",
                "Science-Fiction",
                "Thriller"
            ], schedule: Schedule(time: "20:00", days: ["Tuesday", "Friday"]), image: MazeImage(
                medium: "https://static.tvmaze.com/uploads/images/medium_portrait/240/601964.jpg",
                original: "https://static.tvmaze.com/uploads/images/original_untouched/240/601964.jpg"
            )),
                .init(id: 46563, name: "Guilty Party", genres: [
                    "Drama",
                    "Comedy",
                    "Mystery"
                ], schedule: Schedule(time: "20:00", days: ["Monday"]), image: MazeImage(
                    medium: "https://static.tvmaze.com/uploads/images/medium_portrait/366/916822.jpg",
                    original: "https://static.tvmaze.com/uploads/images/medium_portrait/366/916822.jpg"
                )),
            .init(id: 28276, name: "The Witcher", genres: [
                "Drama",
                "Action",
                "Fantasy"
            ], schedule: Schedule(time: "21:00", days: ["Tuesday"]), image: MazeImage(
                medium: "https://static.tvmaze.com/uploads/images/medium_portrait/465/1163193.jpg",
                original: "https://static.tvmaze.com/uploads/images/original_untouched/465/1163193.jpg"
            ))
            
        ]
    }
}
