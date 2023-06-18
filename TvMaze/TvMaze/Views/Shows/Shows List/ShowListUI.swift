//
//  ShowListUI.swift
//  TvMaze
//
//  Created by Fabio Luiz on 17/06/23.
//

import SwiftUI

struct ShowsList: View {
    @StateObject var viewModel = ShowsListViewModel()
    
    var body: some View {
        ShowsListContent(shows: viewModel.shows)
            .onAppear {
                viewModel.updateShows()
            }
    }
}

private struct ShowsListContent: View {
    var shows: [ShowItem]
    
    var body: some View {
        VStack {
            List(shows) { show in
                Text(show.name)
            }
        }
        .padding()
    }
}

struct ShowList_Previews: PreviewProvider {
    static var previews: some View {
        ShowsListContent(shows: [
            ShowItem(id: 1, name: "Test", genres: ["Drama", "Comedy"], schedule: Schedule(time: "45min", days: ["Mon"])),
            ShowItem(id: 2, name: "Test2", genres: ["Drama", "Comedy"], schedule: Schedule(time: "45min", days: ["Mon"]))
        ])
    }
}
