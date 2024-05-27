//
//  Coordinator.swift
//  Ball Master
//
//  Created by admin on 24.05.2024.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var rootViewController: UIViewController? { get }
    func showPreloader()
    func showOnBoarding()
    func showMainScreen()
    func showProfileScreen()
    func showTermsPolicy(type: TermsPrivacyType)
    func showGameCreation()
    func showActiveGame()
    func showGameDeteil()
    func showCoachDeteil()
    func showPlanerCreation()
    func showPlanerDeteil()
    func popToMain()
    func popOneScreenBack()
    func hidePopUpScreens()
}

final class Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: NavigationVC) {
        self.navigationController = navigationController
    }
    
    
}


extension Coordinator: CoordinatorProtocol {

    var rootViewController: UIViewController? {
        navigationController
    }
    
    
    func showPreloader() {
//        let viewModel = PreloaderViewModel(coordinator: self)
//        let preloaderVC = PreloaderVC(viewModel: viewModel)
//        navigationController.pushViewController(preloaderVC, animated: true)
    }
    
    func showOnBoarding() {
//        let viewModel = OnboardingViewModel(coordinator: self)
//        let onboardingVC = OnboardingVC(viewModel: viewModel)
//        navigationController.pushViewController(onboardingVC, animated: true)
    }
    
    func showMainScreen() {
//        let viewModel = TabViewModel(coordinator: self)
//        let tabViewVC = TabViewVC(viewModel: viewModel)
//        navigationController.pushViewController(tabViewVC, animated: true)
    }
    
    
    func showProfileScreen() {
//        let viewModel = ProfileViewModel(coordinator: self)
//        let profileVC = ProfileVC(viewModel: viewModel)
//        navigationController.pushViewController(profileVC, animated: true)
    }
    

    
    func showTermsPolicy(type: TermsPrivacyType) {
        let viewModel = TermsAndPrivacyViewModel(coordinator: self, termsPrivacy: type)
//        let policyTermsVC = PolicyTermsVC(viewModel: viewModel)
//        navigationController.pushViewController(policyTermsVC, animated: true)
    }
    
    func showGameCreation() {
        
    }
    
    func showActiveGame() {
        
    }
    
    func showGameDeteil() {
        
    }
    
    func showCoachDeteil() {
        
    }
    
    func showPlanerCreation() {
        
    }
    
    func showPlanerDeteil() {
        
    }
    
    
    
    
    func popOneScreenBack() {
        navigationController.popViewController(animated: true)
    }
    

    
    func popToMain() {
//        for controller in self.navigationController.viewControllers as Array {
//            if controller.isKind(of: TabViewVC.self) {
//                self.navigationController.popToViewController(controller, animated: true)
//                break
//            }
//        }
    }
    
    func hidePopUpScreens() {
        navigationController.viewControllers.last?.dismiss(animated: true, completion: nil)
    }
    
}
