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
    var isRunning: Bool = true
    var gameDuration: TimeInterval = 0
    var currentTime: TimeInterval = 0
    var dateCreation: Date = Date()
    var lastUpdateTime: Date? = nil

    
    
    mutating func addEvents(event: Events) {
        self.events.append(event)
        if self.teams.home.id == event.team.id {
            self.score.home.updateScore(amount: event.score)
        } else {
            self.score.away.updateScore(amount: event.score)
        }
        
    }
    
    mutating func deleteEvent(index: IndexSet) {
        for i in index.makeIterator() {
            let event = self.events[i]
            if self.teams.home.id == event.team.id {
                self.score.home.minusScore(amount: event.score)
            } else {
                self.score.away.minusScore(amount: event.score)
            }
        }
        self.events.remove(atOffsets: index)
        
    }
    
    mutating func startGame() {
        isRunning = true
        lastUpdateTime = Date()
    }
    
    mutating func stopGame() {
        isRunning = false
        lastUpdateTime = Date()
    }
    
    
    mutating func update(with interval: TimeInterval) {
            guard isRunning else { return }
            self.currentTime += interval
        }
    
    mutating func adjustTimeSinceLastUpdate() {
          guard let lastUpdateTime = lastUpdateTime else { return }
          let elapsed = Date().timeIntervalSince(lastUpdateTime)
          currentTime += elapsed
          self.lastUpdateTime = Date()
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
    
    mutating func minusScore(amount: Int) {
        self.total -= amount
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

