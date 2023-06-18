//
//  ShowListUI.swift
//  TvMaze
//
//  Created by Fabio Luiz on 17/06/23.
//

import SwiftUI

struct ShowsList: View {
    @EnvironmentObject var global: Global
    @StateObject var viewModel = ShowsListViewModel()
    
    var body: some View {
        ShowsListContent(
            shows: viewModel.shows,
            searchString: viewModel.searchQuery,
            searchHandler: { query in
                viewModel.searchShows(query: query)
            }
        )
        .onAppear {
            viewModel.prepare(with: global)
            viewModel.updateShows()
        }
    }
}

private struct ShowsListContent: View {
    var shows: [ShowItem]
    @State var searchString = ""
    var searchHandler: (String) -> Void
    
    var body: some View {
        NavigationStack {
            List(shows) { show in
                NavigationLink(show.name, destination: ShowDetails(selectedShow: show))
            }
            .navigationTitle("Shows")
        }
        .searchable(text: $searchString)
        .onChange(of: searchString, perform: searchHandler)
    }
}

struct ShowList_Previews: PreviewProvider {
    static var previews: some View {
        ShowsListContent(
            shows: [
                ShowItem(id: 1, name: "The Simpsons", genres: ["Drama", "Comedy"], schedule: Schedule(time: "45min", days: ["Mon"])),
                ShowItem(id: 2, name: "Black Mirror", genres: ["Drama", "Comedy"], schedule: Schedule(time: "45min", days: ["Mon"]))
            ],
            searchString: "",
            searchHandler: { print($0) }
        )
    }
}
