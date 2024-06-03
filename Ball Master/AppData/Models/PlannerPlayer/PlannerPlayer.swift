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
}


enum PlayerOrOpponent {
    case player
    case opponent
}
