//
//  PlannerPlayer.swift
//  Ball Master
//
//  Created by admin on 03.06.2024.
//

import Foundation


struct PlannerPlayer: Identifiable, Hashable {
    var id: UUID = UUID()
    let name: String
    let number: String
    let type: PlayerOrOpponent
    var position: CGPoint
    
    
    static func == (lhs: PlannerPlayer, rhs: PlannerPlayer) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


enum PlayerOrOpponent {
    case player
    case opponent
}


import CoreGraphics

extension CGPoint: Codable {
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let x = try container.decode(CGFloat.self)
        let y = try container.decode(CGFloat.self)
        self.init(x: x, y: y)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(x)
        try container.encode(y)
    }
}
