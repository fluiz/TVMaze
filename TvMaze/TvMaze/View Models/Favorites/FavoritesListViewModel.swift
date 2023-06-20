//
//  FavoritesListViewModel.swift
//  TvMaze
//
//  Created by Fabio Luiz on 19/06/23.
//

import Foundation
import SwiftUI
import Combine

@MainActor class FavoritesListViewModel: ViewModel {
    internal var global: Global?
    private var disposeBag = Set<AnyCancellable>()
    
    @Published private(set) var favoritesList: [ShowItem] = []
    @Published private(set) var searchQuery = ""
    
    init() {
        self.setSearchDebounce()
    }
    
    func filterShows(query: String) {
        self.syncFavoritesList()
        if (!query.isEmpty) {
            favoritesList = favoritesList.filter { show in
                show.name.contains(query)
            }
        }
    }
    
    func syncFavoritesList() {
        guard let favorites = global?.favorites else {
            return
        }
        favoritesList = favorites.refreshFavorites()
    }
    
    private func setSearchDebounce() {
        $searchQuery
            .debounce(for: 1, scheduler: RunLoop.main)
            .sink {
                print("New favorite shows search query \($0)")
                self.filterShows(query: $0)
            }
            .store(in: &disposeBag)
    }
}
