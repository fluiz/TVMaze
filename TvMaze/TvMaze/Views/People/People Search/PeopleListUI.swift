//
//  PeopleListUI.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import SwiftUI

struct PeopleList: View {
    @EnvironmentObject var global: Global
    @StateObject var viewModel = PeopleSearchViewModel()
    
    var body: some View {
        PeopleListContent(people: viewModel.people) { query in
            viewModel.searchPeople(name: query)
        }
            .onAppear {
                viewModel.prepare(with: global)
            }
    }
}

private struct PeopleListContent: View {
    var people: [Person]
    var searchHandler: (String) -> Void
    
    @State private var searchString = ""
    
//    var searchAction: () -> Void {
//        return {
//            searchHandler("Test")
//        }
//    }
    
    var body: some View {
        NavigationStack {
            List(people) { person in
                NavigationLink(person.name, destination: PersonDetails(selectedPerson: person))
            }
            .navigationTitle("Search people")
        }
        .searchable(text: $searchString)
        .onChange(of: searchString, perform: searchHandler)
    }
}

struct PeopleList_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListContent(people: [
            Person(
                id: 5406,
                name: "Kate Woods"
            ),
            Person(
                id: 114411,
                name: "Kate Beckinsale"
            )
        ],
                          searchHandler: {
            print($0)
        }
        )
    }
}
