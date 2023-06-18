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
