//
//  PersonItemUI.swift
//  TvMaze
//
//  Created by Fabio Luiz on 19/06/23.
//

import SwiftUI

struct PersonItemRow: View {
    let person: Person
    
    var body: some View {
        ZStack {
            HStack {
                if let imageURL = person.image?.medium {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 100, height: 150, alignment: .leading)
                }
                Text(person.name).font(.title)
                Spacer()
            }
            
            NavigationLink {
                PersonDetails(selectedPerson: person)
            } label: {
                EmptyView()
            }.opacity(0.0)
        }
    }
}

struct PersonItemRow_Previews: PreviewProvider {
    static var previews: some View {
        PersonItemRow(person: Person.mockArray().first!)
    }
}
