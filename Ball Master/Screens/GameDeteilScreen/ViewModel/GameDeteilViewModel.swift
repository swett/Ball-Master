//
//  GameDeteilViewModel.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 05.06.2024.
//

import Foundation

class GameDeteilViewModel: ObservableObject {
    var model: GameModel
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil, model: GameModel) {
        self.coordinator = coordinator
        self.model = model
    }
}


extension GameDeteilViewModel {
    func backToMain() {
        coordinator?.popOneScreenBack()
    }
    
}
