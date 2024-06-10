//
//  UserStatsViewModel.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 05.06.2024.
//

import Foundation


class UserStatsViewModel: ObservableObject {
    var user: User = AppData.shared.userStat
    @Published var practiceArray: [PracticeModel] = BestPracticeData.models
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil) {
        self.coordinator = coordinator
        self.calculateGameTime()
    }
}


extension UserStatsViewModel {
    func backToMain() {
        coordinator?.popOneScreenBack()
    }
    
    func showPracticeDeteil(model: PracticeModel) {
        coordinator?.showBestPracticeDeteil(model: model)
    }
    
    func showBestPractice() {
        coordinator?.showBestPractice()
    }
    
    func calculateGameTime() {
        let sortedGames = AppData.shared.gamesArray.sorted { $0.gameDuration < $1.gameDuration }
        let shortestGame = sortedGames.first
        let longestGame = sortedGames.last
        user.longestGameUpdate(amount: longestGame?.currentTime.hashValue ?? 0)
        user.shortestGameUpdate(amount: shortestGame?.currentTime.hashValue ?? 0)
        AppData.shared.userStat = user
        AppData.shared.saveUserStats()
    }
}
