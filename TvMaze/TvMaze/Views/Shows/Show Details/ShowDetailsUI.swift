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
        NavigationStack {
            ScrollView {
                VStack {
                    if let imageURL = selectedShow.image?.original {
                        AsyncImage(url: URL(string: imageURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, maxHeight: 300)
                                .clipped()
                        } placeholder: {
                            Color.gray
                        }
                    }
                    Text(selectedShow.name).font(.title)
                    Text(selectedShow.genresString())
                    if let safeSummary = selectedShow.summary {
                        Text(safeSummary)
                    }
                    
                    Text(selectedShow.daysString())
                    if (!selectedShow.schedule.time.isEmpty) {
                        Text("At \(selectedShow.schedule.time)")
                    }
                }
                Spacer()
                Text("Episodes").font(.title2)
                List(episodes) { episode in
                    NavigationLink {
                        EpisodeDetails(selectedEpisode: episode)
                    } label: {
                        HStack {
                            Text(episode.name)
                            Spacer()
                            Text(episode.seasonalNumber())
                        }
                    }
                }
                .frame(height: 500)
                .navigationBarTitleDisplayMode(.inline)
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
                schedule: Schedule(time: "8:00", days: ["Mon"]),
                image: MazeImage(
                    medium: "https://static.tvmaze.com/uploads/images/medium_portrait/366/916822.jpg",
                    original: "https://static.tvmaze.com/uploads/images/original_untouched/366/916822.jpg"
                )
            ), episodes: [
                Episode(id: 1, name: "A night to remember", season: 1, number: 1),
                Episode(id: 2, name: "A thousand cuts", season: 1, number: 2),
                Episode(id: 3, name: "Better late than never", season: 2, number: 1)
            ])
    }
}
