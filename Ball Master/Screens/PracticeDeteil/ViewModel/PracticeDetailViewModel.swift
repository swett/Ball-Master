//
//  PracticeDetailViewModel.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import Foundation


class PracticeDetailViewModel: ObservableObject {
    var model: PracticeModel
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil, model: PracticeModel) {
        self.coordinator = coordinator
        self.model = model
    }
}


extension PracticeDetailViewModel {
    func backToMain() {
        coordinator?.popOneScreenBack()
    }
}
