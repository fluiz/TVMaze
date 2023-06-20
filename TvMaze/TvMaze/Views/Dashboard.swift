//
//  Dashboard.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import SwiftUI

struct Dashboard: View {
    @StateObject var global = Global()
    
    var body: some View {
        TabView {
            ShowsList()
                .tabItem {
                    Label("Shows", systemImage: "sparkles.tv")
                }
            PeopleList()
                .tabItem {
                    Label("People", systemImage: "person")
                }
            FavoritesList()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
        .navigationBarHidden(true)
        .environmentObject(global)
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
