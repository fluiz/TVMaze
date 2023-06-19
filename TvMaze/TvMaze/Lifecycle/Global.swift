//
//  Global.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import SwiftUI

@MainActor
class Global: ObservableObject {
    let apiService = ApiService()
    let favorites = FavoritesStorage()
}
