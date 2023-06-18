//
//  EpisodeDetailsUI.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import SwiftUI

struct EpisodeDetails: View {
    var selectedEpisode: Episode
    
    @EnvironmentObject var global: Global
    
    var body: some View {
        EpisodeDetailsContent(
            selectedEpisode: selectedEpisode
        )
        .onAppear {
//            viewModel.prepare(with: global)
//            viewModel.loadEpisodes(showId: selectedShow.id)
        }
    }
}

private struct EpisodeDetailsContent: View {
    var selectedEpisode: Episode
    
    var body: some View {
        VStack {
            Text(selectedEpisode.name)
            Spacer()
            Text(selectedEpisode.seasonalNumber())
            if let safeSummary = selectedEpisode.summary {
                Spacer()
                Text(safeSummary)
            }
        }
    }
}

struct EpisodeDetails_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailsContent(
            selectedEpisode: Episode(
                id: 1, name: "Apex Predator", season: 1, number: 13,
                summary: "Following the events in England, Agent 47 has escaped to Berlin, where he plans to meet up with Olivia Hall. At their arranged meeting point, Olivia contacts 47 via phone, to warn him that a group of ICA agents are currently tracking them. The agents have pursued Olivia to Club Hölle, a nightclub operating out of a disused power plant."
            ))
    }
}
