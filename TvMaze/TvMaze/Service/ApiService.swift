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
}
