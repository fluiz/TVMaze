//
//  FavoritesStorage.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import Foundation
import SwiftUI

@MainActor
class FavoritesStorage: ObservableObject {
    @Published var favoritesList: [ShowItem] = []
    
    private let userDefaults = UserDefaults.standard
    private let FAVORITES_KEY = "favoriteskey"
    
    init() {
        self.loadFavorites()
    }
    
    func addFavorite(show: ShowItem) {
        if (isFavorite(showId: show.id)) {
            return
        }
        favoritesList.append(show)
        favoritesList.sort {
            $0.name < $1.name
        }
        saveFavorites()
    }
    
    func removeFavorite(showId: Int) {
        if let index = favoritesList.firstIndex(where: { $0.id == showId }) {
            favoritesList.remove(at: index)
            saveFavorites()
        }
    }
    
    func isFavorite(showId: Int) -> Bool {
        return favoritesList.contains { item in
            item.id == showId
        }
    }
    
    func refreshFavorites() -> [ShowItem] {
        loadFavorites()
        return favoritesList
    }
    
    private func saveFavorites() {
        do {
            let encodedData = try JSONEncoder().encode(favoritesList)
            userDefaults.set(encodedData, forKey: FAVORITES_KEY)
        } catch {
            print(error)
        }
    }
    
    private func loadFavorites() {
        var savedFavorites: [ShowItem] = []
        if let savedData = userDefaults.object(forKey: FAVORITES_KEY) as? Data {
            do {
                savedFavorites = try JSONDecoder().decode([ShowItem].self, from: savedData)
            } catch {
                print(error)
            }
        }
        favoritesList = savedFavorites
    }
}
