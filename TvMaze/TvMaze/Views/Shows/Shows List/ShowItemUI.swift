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
                }.padding(.leading, 16)
                Spacer()
//                FavoriteIcon(favorited: favorited).frame(alignment: .trailing)
            }.background(Color.blue)
            
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
            item: ShowItem.mockArray().first!,
            favorited: false
        )
    }
}
