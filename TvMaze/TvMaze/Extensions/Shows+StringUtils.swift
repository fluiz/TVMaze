//
//  Shows+StringUtils.swift
//  TvMaze
//
//  Created by Fabio Luiz on 18/06/23.
//

import Foundation

extension ShowItem {
    func genresString() -> String {
        var content = ""
        genres.forEach { item in
            content += "\(item) "
        }
        return content.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
