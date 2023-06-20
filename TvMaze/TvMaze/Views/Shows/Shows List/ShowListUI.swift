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
        VStack {
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
        }.alert(isPresented: $viewModel.gotError) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage ?? "Unknown error"),
                dismissButton: .default(
                    Text("OK"),
                    action: {
                        viewModel.clearError()
                    }
                )
            )
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
                ShowItemRow(item: show)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
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
            shows: ShowItem.mockArray(),
            searchString: "",
            searchHandler: { print($0) }
        )
    }
}
