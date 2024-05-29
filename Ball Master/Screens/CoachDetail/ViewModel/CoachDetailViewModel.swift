//
//  CoachDetailViewModel.swift
//  Ball Master
//
//  Created by admin on 28.05.2024.
//

import Foundation


class CoachDetailViewModel: ObservableObject {
    @Published var isSaved: Bool = false
    var model: CoachModel
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil, model: CoachModel) {
        self.coordinator = coordinator
        self.model = model
        self.checkSave()
    }
}


extension CoachDetailViewModel {
    func backToMain() {
        coordinator?.popOneScreenBack()
    }
    
    func saveCoach() {
        AppData.shared.addStrategyToSavedStrategy(model: model)
        checkSave()
    }
    
    func checkSave() {
        if AppData.shared.savedCoaches.firstIndex(where: { $0.id == model.id }) != nil {
            isSaved = true
        } else {
            isSaved = false
        }
    }
}

