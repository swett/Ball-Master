//
//  PlannerDeteilViewModel.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import Foundation


class PlannerDeteilViewModel: ObservableObject {
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil) {
        self.coordinator = coordinator

    }
}


extension PlannerDeteilViewModel {
    func backToMain() {
        coordinator?.popOneScreenBack()
    }
    
}
