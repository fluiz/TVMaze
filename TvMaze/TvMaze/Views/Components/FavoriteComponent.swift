//
//  FavoriteComponent.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import SwiftUI

struct FavoriteIcon: View {
    var favorited: Bool
    
    var body: some View {
        let image = favorited ? "heart.fill" : "heart"
        Image(systemName: image)
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundColor(Color.red)
    }
}

struct FavoriteIcon_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteIcon(favorited: true)
    }
}
