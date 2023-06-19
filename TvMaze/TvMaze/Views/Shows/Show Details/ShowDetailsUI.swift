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
                    EpisodeItemRow(episode: episode)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
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
            selectedShow: ShowItem.mockArray().first!,
            episodes: Episode.mockArray()
        )
    }
}
