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
        PeopleListContent(people: viewModel.people, searchString: viewModel.searchQuery) { query in
                viewModel.searchPeople(name: query)
        }
        .onAppear {
            viewModel.prepare(with: global)
        }
    }
}

private struct PeopleListContent: View {
    var people: [Person]
    @State var searchString = ""
    var searchHandler: (String) -> Void
    
    var body: some View {
        NavigationStack {
            List(people) { person in
                PersonItemRow(person: person)
            }
            .navigationTitle("People")
        }
        .searchable(text: $searchString)
        .onChange(of: searchString, perform: searchHandler)
    }
}

struct PeopleList_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListContent(people: Person.mockArray(),
        searchString: "",
        searchHandler: { print($0) }
        )
    }
}
