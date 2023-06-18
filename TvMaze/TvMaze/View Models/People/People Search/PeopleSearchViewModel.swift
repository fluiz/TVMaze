//
//  PeopleSearchViewModel.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import Foundation
import SwiftUI
import Combine

@MainActor class PeopleSearchViewModel: ViewModel {
    var global: Global?
    private var disposeBag = Set<AnyCancellable>()
    
    @Published var people: [Person] = []
    @Published var searchQuery = ""
    
    init() {
        self.setSearchDebounce()
    }
    
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
    
    private func setSearchDebounce() {
        $searchQuery
            .debounce(for: 1, scheduler: RunLoop.main)
            .sink {
                print("New search query \($0)")
                self.searchPeople(name: $0)
            }
            .store(in: &disposeBag)
    }
}
