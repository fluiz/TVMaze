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
            content += "\(item), "
        }
        content.removeLast(2)
        return content
    }
    
    func daysString() -> String {
        var content = ""
        schedule.days.forEach { day in
            content += "\(day), "
        }
        content.removeLast(2)
        return content
    }
}
