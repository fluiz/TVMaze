//
//  ShowDetailsUI.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import SwiftUI

struct ShowDetails: View {
    var selectedShow: ShowItem
    
    @EnvironmentObject var global: Global
    @StateObject var viewModel = ShowDetailsViewModel()
    
    var body: some View {
        ShowDetailsContent(
            selectedShow: selectedShow, episodes: viewModel.episodes
        )
        .onAppear {
            viewModel.prepare(with: global)
            viewModel.loadEpisodes(showId: selectedShow.id)
        }
    }
}

private struct ShowDetailsContent: View {
    var selectedShow: ShowItem
    var episodes: [Episode]
    
    var body: some View {
        VStack {
            Text(selectedShow.name)
            Spacer()
            List(episodes) { episode in
                HStack {
                    Text(episode.name)
                    Spacer()
                    Text("S\(episode.season)E\(episode.number)")
                }
            }
        }
    }
}

struct ShowDetails_Previews: PreviewProvider {
    static var previews: some View {
        ShowDetailsContent(
            selectedShow: ShowItem(
                id: 1,
                name: "Sandman",
                genres: ["Drama", "Comedy"],
                schedule: Schedule(time: "45min", days: ["Mon"])
            ), episodes: [
                Episode(id: 1, name: "A night to remember", season: 1, number: 1),
                Episode(id: 2, name: "A thousand cuts", season: 1, number: 2),
                Episode(id: 3, name: "Better late than never", season: 2, number: 1)
            ])
    }
}
