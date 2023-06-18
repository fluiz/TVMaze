//
//  ShowDetailsViewModel.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import Foundation
import SwiftUI

@MainActor class ShowDetailsViewModel: ViewModel {
    var global: Global?
    
    @Published var episodes: [Episode] = []
    
    func loadEpisodes(showId: Int) {
        Task {
            do {
                guard let service = global?.apiService else {
                    return
                }
                episodes = try await service.getEpisodes(showId: showId)
            } catch {
                print(error)
            }
        }
    }
}
