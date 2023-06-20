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
    }
}

private struct EpisodeDetailsContent: View {
    var selectedEpisode: Episode
    
    var body: some View {
        ScrollView {
            VStack {
                if let imageURL = selectedEpisode.image?.original {
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
                
                Text(selectedEpisode.name).font(.title)
                
                Spacer()
                
                Text(selectedEpisode.seasonalNumber())
                
                if let safeSummary = selectedEpisode.summary?.stripHTMLTags() {
                    Spacer()
                    Text(safeSummary).padding()
                }
            }
        }
    }
}

struct EpisodeDetails_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailsContent(
            selectedEpisode: Episode.mockArray().first!
        )
    }
}
