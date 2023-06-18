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
            Text(selectedPerson.name)
            Spacer()
            List(credits) { credit in
                NavigationLink {
                    ShowDetails(selectedShow: credit)
                } label: {
                    HStack {
                        Text(credit.name)
                        Spacer()
                        Text("Genres would be cool")
                    }
                }
            }
        }
    }
}

struct PersonDetails_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailsContent(
            selectedPerson: Person(
                id: 14245,
                name: "Bryan Cranston"
            ),
            credits: [
                ShowItem(id: 1, name: "The Simpsons", genres: ["Drama", "Comedy"], schedule: Schedule(time: "45min", days: ["Mon"])),
                ShowItem(id: 2, name: "Black Mirror", genres: ["Drama", "Comedy"], schedule: Schedule(time: "45min", days: ["Mon"]))
            ])
    }
}
