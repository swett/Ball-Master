//
//  GamesViewModel.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import Foundation
import Combine
class GamesViewModel: ObservableObject {
    @Published var gamesArray: [GameModel] = []
    var games: [GameModel] = AppData.shared.gamesArray
    private let coordinator: CoordinatorProtocol?
    private var cancellables = Set<AnyCancellable>()
    var view: TabViewVC?
    init(coordinator: CoordinatorProtocol? = nil, view: TabViewVC? = nil) {
        self.coordinator = coordinator
        self.view = view
        self.gamesArray = games
        TimerManager.shared.$timerTick
            .sink { [weak self] _ in
                self?.updateGames()
            }
            .store(in: &cancellables)
    }
    
    deinit {
        TimerManager.shared.stop()
        cancellables.forEach { $0.cancel() }
//        self.updateLastDate()
    }
}


extension GamesViewModel {
    func openCreationGame() {
        coordinator?.showGameCreation()
    }
    
    func openGameDeteil(model: GameModel) {
        coordinator?.showGameDeteil(game: model)
    }
    
    func openActiveGameScreen(model: GameModel) {
        updateLastDate()
        coordinator?.showActiveGame(game: model)
    }
}


extension GamesViewModel {
    private func updateGames() {
            for index in gamesArray.indices {
                if gamesArray[index].isRunning {
                    gamesArray[index].update(with: 1.0) // Assuming 1-second interval
                }
            }
        }

    func adjustTimesOnAppear() {
        games = AppData.shared.gamesArray
        gamesArray = games
        print(games)
        for index in gamesArray.indices {
            if gamesArray[index].isRunning {
                gamesArray[index].adjustTimeSinceLastUpdate()
            }
        }
        
        if gamesArray.contains(where: { $0.isRunning == true }) {
            TimerManager.shared.start()
        } else {
//            TimerManager.shared.stop()
        }
    }
    
    func updateLastDate() {
        for index in gamesArray.indices {
            if gamesArray[index].isRunning {
                gamesArray[index].lastUpdateTime = Date()
            }
        }
        AppData.shared.gamesArray = gamesArray
        AppData.shared.saveGames()
        TimerManager.shared.stop()
        cancellables.forEach { $0.cancel() }
    }
}
