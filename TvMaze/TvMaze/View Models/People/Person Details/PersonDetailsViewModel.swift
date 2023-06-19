//
//  PersonDetailsViewModel.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import Foundation
import SwiftUI

@MainActor class PersonDetailsViewModel: ViewModel {
    var global: Global?
    
    @Published var credits: [ShowItem] = []
    
    func getCredits(personId: Int) {
        Task {
            do {
                guard let service = global?.apiService else {
                    return
                }
                let results = try await service.getCredits(personId: personId)
                credits = results.map { result in
                    result.credit.show
                }
            } catch {
                print(error)
            }
        }
    }
}
