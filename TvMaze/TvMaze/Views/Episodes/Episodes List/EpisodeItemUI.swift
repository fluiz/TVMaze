//
//  EpisodeItemUI.swift
//  TvMaze
//
//  Created by Fabio Luiz on 19/06/23.
//

import SwiftUI

struct EpisodeItemRow: View {
    let episode: Episode
    
    var body: some View {
        ZStack {
            HStack {
                if let imageURL = episode.image?.medium {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 100, alignment: .leading)
                }
                
                VStack(alignment: .leading) {
                    Text(episode.name).font(.title2)
                    Text(episode.seasonalNumber()).font(.body)
                }
                
                Spacer()
            }
            
            NavigationLink {
                EpisodeDetails(selectedEpisode: episode)
            } label: {
                EmptyView()
            }.opacity(0.0)
        }
    }
}

struct EpisodeItemRow_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeItemRow(episode: Episode.mockArray().first!)
    }
}
