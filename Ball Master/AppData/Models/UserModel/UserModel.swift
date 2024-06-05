//
//  UserModel.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 05.06.2024.
//

import Foundation


struct User: Identifiable, Codable {
    let id: UUID = UUID()
    var gamesCreated: Int = 0
    var plannersCreated: Int = 0
    var longestGame: Int = 0
    var shortestGame: Int = 0
    
    
    mutating func gamesAdd() {
        self.gamesCreated += 1
    }
    
    mutating func plannersAdd() {
        self.plannersCreated += 1
    }
}
