//
//  OnBoardingViewModel.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import Foundation
class OnboardingViewModel: ObservableObject {
       private let coordinator: CoordinatorProtocol?
       
       init(coordinator: CoordinatorProtocol? = nil) {
           self.coordinator = coordinator
       }
}

extension OnboardingViewModel {
    func openMainScreen() {
        coordinator?.showMainScreen()
    }
}
