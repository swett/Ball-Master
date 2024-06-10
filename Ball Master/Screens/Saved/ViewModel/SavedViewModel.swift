//
//  SavedViewModel.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import Foundation


class SavedViewModel: ObservableObject {
    @Published var coaches: [CoachModel] = []
    @Published var games: [GameModel] = []
    var savedCoaches: [CoachModel] = []
    var savedGames:[GameModel] = AppData.shared.savedGames
    @Published var selectedIndex: Int = 0
    var saveHandler: (_ index: Int) -> Void = {index in}
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil) {
        self.coordinator = coordinator
        self.games = savedGames
        self.coaches = savedCoaches
        self.bind()
    }
}


extension SavedViewModel {
    func backToMain() {
        coordinator?.popOneScreenBack()
    }
    func showDeteilGame(model: GameModel) {
        coordinator?.showGameDeteil(game: model)
    }
    
    func showCoachDeteil(model: CoachModel) {
        coordinator?.showCoachDeteil(coach: model)
    }
}


extension SavedViewModel {
    func bind() {
        saveHandler = { index in
            AppData.shared.addStrategyToSavedStrategy(model: self.coaches[index])
            self.savedCoaches = AppData.shared.getSavedCoaches()
            self.coaches = self.savedCoaches
        }
    }
    
}
