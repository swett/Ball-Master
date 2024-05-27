//
//  PreloaderViewModel.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import Foundation
class PreloaderViewModel: ObservableObject {
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }
}


extension PreloaderViewModel {
    func showOnboarding() {
        coordinator?.showOnBoarding()
    }
}
