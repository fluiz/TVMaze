//
//  Episodes+STringUtils.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import Foundation
import SwiftUI

extension Episode {
    func seasonalNumber() -> String {
        return "S\(season)E\(number)"
    }
}
