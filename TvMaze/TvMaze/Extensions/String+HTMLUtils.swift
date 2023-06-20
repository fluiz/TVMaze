//
//  String+HTMLUtils.swift
//  TvMaze
//
//  Created by Fabio Luiz on 20/06/23.
//

import Foundation

extension String {
    func stripHTMLTags() -> String? {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
