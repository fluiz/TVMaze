//
//  PeopleDetailsUI.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import SwiftUI

struct PersonDetails: View {
    var selectedPerson: Person
    
    @EnvironmentObject var global: Global
    @StateObject var viewModel = PersonDetailsViewModel()
    
    var body: some View {
        PersonDetailsContent(
            selectedPerson: selectedPerson,
            credits: viewModel.credits
        ).onAppear {
            viewModel.prepare(with: global)
            viewModel.getCredits(personId: selectedPerson.id)
        }
    }
}

private struct PersonDetailsContent: View {
    var selectedPerson: Person
    var credits: [ShowItem]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if let imageURL = selectedPerson.image?.original {
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
                Text(selectedPerson.name).font(.title)
                Spacer()
                Text("TV Shows").font(.title2)
                List(credits) { credit in
                    ShowItemRow(item: credit, favorited: false)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                }
                .frame(height: 500)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct PersonDetails_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailsContent(
            selectedPerson: Person(
                id: 14245,
                name: "Henry Cavill"
            ),
            credits: ShowItem.mockArray())
    }
}
