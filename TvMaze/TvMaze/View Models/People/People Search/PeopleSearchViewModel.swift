//
//  PeopleSearchViewModel.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import Foundation
import SwiftUI

@MainActor class PeopleSearchViewModel: ViewModel {
    var global: Global?
    
    @Published var people: [Person] = []
    
    func searchPeople(name: String) {
        Task {
            do {
                guard let service = global?.apiService else {
                    return
                }
                let peopleResult = try await service.searchPeople(query: name)
                print("Found \(peopleResult.count) results")
                people = peopleResult.map { result in
                    result.person
                }
            } catch {
                print(error)
            }
        }
    }
}
