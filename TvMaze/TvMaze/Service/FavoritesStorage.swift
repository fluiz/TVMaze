//
//  FavoritesStorage.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import Foundation

class FavoritesStorage {
    private let FAVORITES_KEY = "favoriteskey"
    private var favorites: [ShowItem] = []
    private let userDefaults = UserDefaults.standard
    
    init() {
        favorites = loadFavorites()
    }
    
    func addFavorite(show: ShowItem) {
        if (isFavorite(showId: show.id)) {
            return
        }
        favorites.append(show)
        saveFavorites()
    }
    
    func removeFavorite(showId: Int) {
        if let index = favorites.firstIndex(where: { $0.id == showId }) {
            favorites.remove(at: index)
        }
    }
    
    func isFavorite(showId: Int) -> Bool {
        return favorites.contains { item in
            item.id == showId
        }
    }
    
    private func saveFavorites() {
        do {
            let encodedData = try JSONEncoder().encode(favorites)
            userDefaults.set(encodedData, forKey: FAVORITES_KEY)
        } catch {
            print(error)
        }
    }
    
    private func loadFavorites() -> [ShowItem] {
        var savedFavorites: [ShowItem] = []
        if let savedData = userDefaults.object(forKey: FAVORITES_KEY) as? Data {
            do {
                savedFavorites = try JSONDecoder().decode([ShowItem].self, from: savedData)
            } catch {
                print(error)
            }
        }
        return savedFavorites
    }
}
