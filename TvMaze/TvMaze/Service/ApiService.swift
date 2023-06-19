//
//  ApiService.swift
//  TvMaze
//
//  Created by Fabio Luiz on 17/06/23.
//

import Foundation

class ApiService: ApiBaseService {
    func getShows(page: Int) async throws -> [ShowItem] {
        return try await request("shows?page=\(page)", type: [ShowItem].self)
    }
    
    func getEpisodes(showId: Int) async throws -> [Episode] {
        return try await request("shows/\(showId)/episodes", type: [Episode].self)
    }
    
    func searchPeople(query: String) async throws -> [PeopleSearchResult] {
        return try await request("search/people?q=\(query.replacingOccurrences(of: " ", with: "%20"))", type: [PeopleSearchResult].self)
    }
    
    func getCredits(personId: Int) async throws -> [CreditResult] {
        return try await request("people/\(personId)/castcredits?embed=show", type: [CreditResult].self)
    }
    
    func searchShows(query: String) async throws -> [ShowSearchResult] {
        return try await request("search/shows?q=\(query.replacingOccurrences(of: " ", with: "%20"))", type: [ShowSearchResult].self)
    }
}
