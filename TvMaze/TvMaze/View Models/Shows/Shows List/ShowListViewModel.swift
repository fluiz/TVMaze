//
//  ShowListViewModel.swift
//  TvMaze
//
//  Created by Fabio Luiz on 17/06/23.
//

import Foundation
import SwiftUI

@MainActor class ShowsListViewModel: ObservableObject {
    @Published var shows: [ShowItem] = []
    private let service = ApiService()
    
    func updateShows() {
        Task {
            do {
                shows = try await service.getShows(page: 0)
                print("Loading finished")
                print(shows)
            } catch {
                print(error)
            }
        }
        
    }
}
