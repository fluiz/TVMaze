//
//  ShowItemUI.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import SwiftUI

struct ShowItemRow: View {
    let item: ShowItem
    
    var body: some View {
        HStack {
            if let imageURL = item.image?.medium {
                AsyncImage(
                    url: URL(string: imageURL)
                )
            }
            VStack {
                Text(item.name)
                Text(item.genresString())
            }
        }
    }
}

struct ShowItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ShowItemRow(item: ShowItem(id: 1, name: "The Simpsons", genres: ["Drama", "Comedy"], schedule: Schedule(time: "45min", days: ["Mon"])))
    }
}
