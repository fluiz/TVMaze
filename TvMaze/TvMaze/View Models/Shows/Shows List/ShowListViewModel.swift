//
//  ShowListViewModel.swift
//  TvMaze
//
//  Created by Fabio Luiz on 17/06/23.
//

import Foundation
import SwiftUI
import Combine

@MainActor class ShowsListViewModel: ViewModel {
    var global: Global?
    private var disposeBag = Set<AnyCancellable>()
    
    @Published private(set) var shows: [ShowItem] = []
    @Published private(set) var searchQuery = ""
    
    @Published private(set) var errorMessage: String? = nil {
        didSet {
            if (errorMessage == nil) {
                gotError = false
            } else {
                gotError = true
            }
        }
    }
    @Published var gotError: Bool = false
    
    init() {
        self.setSearchDebounce()
    }
    
    func updateShows() {
        guard let service = global?.apiService else {
            return
        }
        Task {
            do {
                shows = try await service.getShows(page: 0)
            } catch {
                print(error)
                errorMessage = "Error loading shows. Please try again later."
            }
        }
    }
    
    func searchShows(query: String) {
        if (query.isEmpty) {
            updateShows()
            return
        }
        guard let service = global?.apiService else {
            return
        }
        Task {
            do {
                let showsResult = try await service.searchShows(query: query)
                print("Found \(showsResult.count) results")
                shows = showsResult.map { result in
                    result.show
                }
            } catch {
                print(error)
                errorMessage = "Error searching for shows. Please try again later."
            }
        }
    }
    
    func clearError() {
        errorMessage = nil
        gotError = false
    }
    
    private func setSearchDebounce() {
        $searchQuery
            .debounce(for: 1, scheduler: RunLoop.main)
            .sink {
                print("New show search query \($0)")
                self.searchShows(query: $0)
            }
            .store(in: &disposeBag)
    }
}
