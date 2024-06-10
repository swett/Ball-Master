//
//  CoachViewModel.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import Foundation


class CoachViewModel: ObservableObject {
    var coaches: [CoachModel] = BasketballStrategies.strategies
    @Published var savedCoachesUpdates: [CoachModel] = []
    var savedCoaches: [CoachModel] = AppData.shared.savedCoaches
    var view: TabViewVC?
    var saveHandler: (_ index: Int) -> Void = {index in}
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil, view: TabViewVC? = nil) {
        self.coordinator = coordinator
        self.view = view
        self.bind()
        self.savedCoachesUpdates = self.savedCoaches
    }
}



extension CoachViewModel {
    func bind() {
        saveHandler = { index in
            AppData.shared.addStrategyToSavedStrategy(model: self.coaches[index])
            self.savedCoaches = AppData.shared.getSavedCoaches()
            self.savedCoachesUpdates = self.savedCoaches
        }
    }
    
    func openDeteilCoach(model: CoachModel) {
        coordinator?.showCoachDeteil(coach: model)
    }
}
