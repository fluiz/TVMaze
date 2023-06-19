//
//  ViewModel.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import Foundation

@MainActor protocol ViewModel: ObservableObject {
    var global: Global? { get set }
}

extension ViewModel {
    func prepare(with global: Global) {
        self.global = global
    }
}
