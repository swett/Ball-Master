//
//  GameActiveViewModel.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 04.06.2024.
//

import Foundation
import Combine
class GameActiveViewModel: ObservableObject {
    @Published var gameUpdate: GameModel?
    @Published var isSheetShowed: Bool = false
    @Published var isShowAlert: Bool = false
    @Published var isShowAlerRefresh: Bool = false
    @Published var selectedTeam: Int = 1
    @Published var isSaved: Bool = false
    private var cancellables = Set<AnyCancellable>()
    var game: GameModel
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil, game: GameModel) {
        self.coordinator = coordinator
        self.game = game
        self.gameUpdate = self.game
        self.checkIsSaved()
        TimerManager.shared.start()

        TimerManager.shared.$timerTick
            .sink { _ in
                self.updateGameModel()
            }
            .store(in: &cancellables)
    }
    
    deinit {
        TimerManager.shared.stop()
        cancellables.forEach { $0.cancel() }
    }
}


extension GameActiveViewModel {
    func addEvent(event: Events) {
        gameUpdate?.addEvents(event: event)
        game = gameUpdate!
    }
    
    func backToMain() {
        coordinator?.popToMain()
    }
}


extension GameActiveViewModel {


    private func updateGameModel() {
        game.update(with: 1.0) // Assuming 1 second interval for now
        gameUpdate = game
        }
    
    func updateAndSaveModel() {
        game.lastUpdateTime = Date()
        if let index = AppData.shared.gamesArray.firstIndex(where: {$0.id == game.id}) {
            AppData.shared.gamesArray[index] = game
            AppData.shared.saveGames()
        } 
    }
    
    func refreshData() {
        if let index = AppData.shared.gamesArray.firstIndex(where: {$0.id == game.id}) {
            AppData.shared.gamesArray[index] = game
            AppData.shared.saveGames()
        }
        if let index = AppData.shared.savedGames.firstIndex(where: {$0.id == game.id}) {
            AppData.shared.savedGames[index] = game
            AppData.shared.saveGamesToFavorite()
        }
    }
    
    func leaveFromScreen() {
        updateAndSaveModel()
        backToMain()
    }
    
    func saveGame() {
        if let index = AppData.shared.savedGames.firstIndex(where: {$0.id == game.id}) {
            AppData.shared.savedGames.remove(at: index)
        } else {
            AppData.shared.savedGames.append(game)
            
        }
        
        AppData.shared.saveGamesToFavorite()
        checkIsSaved()
    }
    
    func checkIsSaved() {
        if let index = AppData.shared.savedGames.firstIndex(where: {$0.id == game.id}) {
            isSaved = true
        } else {
            isSaved = false
            
        }
    }
    
    func finishGame() {
        game.stopGame()
        TimerManager.shared.stop()
        cancellables.forEach { $0.cancel() }
        refreshData()
    }
}
