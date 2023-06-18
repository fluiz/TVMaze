//
//  Episodes+STringUtils.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import Foundation

extension Episode {
    func seasonalNumber() -> String {
        return "S\(season)E\(number)"
    }
}
