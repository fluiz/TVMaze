//
//  EpisodeListUI.swift
//  TvMaze
//
//  Created by Fabio Luiz on 20/06/23.
//

import SwiftUI

struct EpisodeList: View {
    let episodes: [Episode]
    let seasonCount: Int
    
    var body: some View {
        VStack {
            if (!episodes.isEmpty) {
                HStack {
                    Text("Episodes").font(.title2)
                    Spacer()
                }.padding()
            }
            
            if (seasonCount == 0) {
                List(episodes) { episode in
                    EpisodeItemRow(episode: episode)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                }
            } else {
                List {
                    ForEach(1...seasonCount, id: \.self) { sectionSeason in
                        Section(header: Text("Season \(sectionSeason)")) {
                            ForEach(episodes.filter { episode in
                                episode.season == sectionSeason
                            }) { episode in
                                EpisodeItemRow(episode: episode)
                                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                            }
                        }
                    }
                }
            }
        }
    }
}

struct EpisodeList_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeList(
            episodes: Episode.mockArray(),
            seasonCount: 3
        )
    }
}
