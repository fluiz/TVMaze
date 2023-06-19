//
//  ShowItemUI.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import SwiftUI

struct ShowItemRow: View {
    let item: ShowItem
    let favorited: Bool
    
    var body: some View {
        ZStack {
            HStack {
                if let imageURL = item.image?.medium {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 100, height: 150, alignment: .leading)
                }
                VStack(alignment: .leading) {
                    Text(item.name).font(.title)
                    Text(item.genresString())
                }
                Spacer()
//                FavoriteIcon(favorited: favorited).frame(alignment: .trailing)
            }
            .frame(
                maxWidth: .infinity
            )
            .background(Color.blue)
            NavigationLink {
                ShowDetails(selectedShow: item)
            } label: {
                EmptyView()
            }.opacity(0.0)
        }
    }
}

struct ShowItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ShowItemRow(
            item: ShowItem(
                id: 1,
                name: "The Simpsons",
                genres: ["Drama", "Comedy"],
                schedule: Schedule(time: "45min",days: ["Mon"]),
                image: MazeImage(
                    medium: "https://static.tvmaze.com/uploads/images/medium_portrait/366/916822.jpg",
                    original: "https://static.tvmaze.com/uploads/images/original_untouched/366/916822.jpg"
                )
            ),
            favorited: false
        )
    }
}
