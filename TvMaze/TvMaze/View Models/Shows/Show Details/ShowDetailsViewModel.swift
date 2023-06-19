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
    @Published var favorited: Bool = false
    
    func loadEpisodes(showId: Int) {
        syncFavorited(showId: showId)
        guard let service = global?.apiService else {
            return
        }
        Task {
            do {
                episodes = try await service.getEpisodes(showId: showId)
            } catch {
                print(error)
            }
        }
    }
    
    func toggleFavorite(show: ShowItem) {
        guard let favorites = global?.favorites else {
            return
        }
        if (favorited) {
            favorites.removeFavorite(showId: show.id)
        } else {
            favorites.addFavorite(show: show)
        }
        syncFavorited(showId: show.id)
    }
    
    private func syncFavorited(showId: Int) {
        guard let favorites = global?.favorites else {
            return
        }
        favorited = favorites.isFavorite(showId: showId)
    }
}
