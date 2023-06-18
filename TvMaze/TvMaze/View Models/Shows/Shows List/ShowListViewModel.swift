//
//  ShowListViewModel.swift
//  TvMaze
//
//  Created by Fabio Luiz on 17/06/23.
//

import Foundation
import SwiftUI

@MainActor class ShowsListViewModel: ViewModel {
    var global: Global?
    
    @Published var shows: [ShowItem] = []
    
    func updateShows() {
        Task {
            do {
                guard let service = global?.apiService else {
                    return
                }
                shows = try await service.getShows(page: 0)
//                print("Loading finished")
//                print(shows)
            } catch {
                print(error)
            }
        }
        
    }
}
