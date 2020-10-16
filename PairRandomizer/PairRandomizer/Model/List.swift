//
//  List.swift
//  PairRandomizer
//
//  Created by Alex Kennedy on 10/16/20.
//  Copyright © 2020 Alex Kennedy. All rights reserved.
//

import Foundation

class List: Codable {
    var object: String
    
    init(object: String) {
        self.object = object
    }
}

// MARK: - extensions
extension List: Equatable {
    static func == (lhs: List, rhs: List) -> Bool {
        return lhs.object == rhs.object
    }
}
