//
//  ApiBaseService.swift
//  TvMaze
//
//  Created by Fabio Luiz on 17/06/23.
//

import Foundation

class ApiBaseService {
    private let baseURL = "https://api.tvmaze.com/"
    private let decoder = JSONDecoder()
    
    func request<Result: Decodable>(_ endpoint: String, type: Result.Type) async throws -> Result {
        let url = URL(string:baseURL + endpoint)!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try decoder.decode(type, from: data)
        return decoded
    }
}
