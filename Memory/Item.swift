//
//  Item.swift
//  Memory
//
//  Created by Bastien Trevisan on 20/07/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
