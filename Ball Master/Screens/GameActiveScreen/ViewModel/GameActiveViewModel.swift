//
//  GameActiveViewModel.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 04.06.2024.
//

import Foundation


class GameActiveViewModel: ObservableObject {
    @Published var gameUpdate: GameModel?
    @Published var isSheetShowed: Bool = false
    @Published var isShowAlert: Bool = false
    @Published var isShowAlerRefresh: Bool = false
    @Published var selectedTeam: Int = 1
    var game: GameModel
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil, game: GameModel) {
        self.coordinator = coordinator
        self.game = game
        self.gameUpdate = self.game
        self.defaultEvents()
    }
}


extension GameActiveViewModel {
    func addEvent(event: Events) {
        gameUpdate?.addEvents(event: event)
        game = gameUpdate!
    }
    
    func defaultEvents() {
        gameUpdate?.addEvents(event: Events(time: 10, team: (gameUpdate?.teams.home)!, score: 10))
        gameUpdate?.addEvents(event: Events(time: 12, team: (gameUpdate?.teams.away)!, score: 10))
        gameUpdate?.addEvents(event: Events(time: 15, team: (gameUpdate?.teams.home)!, score: 10))
    }
}
