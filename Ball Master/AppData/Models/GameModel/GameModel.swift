//
//  GameModel.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 04.06.2024.
//

import Foundation


struct GameModel: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    let teams: Teams
    var score: ScoreInfo
    var events: [Events] = []
    var isRunning: Bool = false
    var gameDuration: TimeInterval = 0
    var dateCreation: Date = Date()
    var startTime: Date?
    var endTime: Date?

    
    
    mutating func addEvents(event: Events) {
        self.events.append(event)
        if self.teams.home.id == event.team.id {
            self.score.home.updateScore(amount: event.score)
        } else {
            self.score.away.updateScore(amount: event.score)
        }
        
    }
}


struct Teams: Codable, Hashable {
    let home: TeamModel
    let away: TeamModel
}

struct Score: Codable, Hashable {
    var total: Int = 0
    
    mutating func updateScore(amount: Int) {
        self.total += amount
    }
    
}

struct ScoreInfo: Codable, Hashable {
    var home: Score
    var away: Score
    

}

struct Events: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    var time: Int
    var team: TeamModel
    var score: Int
}

