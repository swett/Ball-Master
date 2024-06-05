//
//  PlannerDeteilViewModel.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import Foundation


class PlannerDeteilViewModel: ObservableObject {
    var model: PlannerModel
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil, planner: PlannerModel) {
        self.coordinator = coordinator
        self.model = planner
    }
}


extension PlannerDeteilViewModel {
    func backToMain() {
        coordinator?.popOneScreenBack()
    }
    
}
