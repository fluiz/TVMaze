//
//  FavoritesListUI.swift
//  TvMaze
//
//  Created by Fabio Luiz on 19/06/23.
//

import SwiftUI

struct FavoritesList: View {
    @EnvironmentObject var global: Global
    @StateObject var viewModel = FavoritesListViewModel()
    
    var body: some View {
        FavoritesListContent(
            favoriteShows: viewModel.favoritesList,
            searchHandler: { query in
                viewModel.filterShows(query: query)
            }
        )
        .onAppear {
            viewModel.prepare(with: global)
            viewModel.syncFavoritesList()
        }
    }
}

private struct FavoritesListContent: View {
    var favoriteShows: [ShowItem]
    @State var searchString = ""
    var searchHandler: (String) -> Void
    
    var body: some View {
        NavigationStack {
            List(favoriteShows) { show in
                ShowItemRow(
                    item: show
                ).listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
            }
            .navigationTitle("Favorites")
            .onAppear {
                searchHandler(searchString)
            }
        }
        .searchable(text: $searchString)
        .onChange(of: searchString, perform: searchHandler)
    }
}

struct FavoritesList_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListContent(
            favoriteShows: ShowItem.mockArray(),
            searchHandler: { print($0) }
        )
    }
}
