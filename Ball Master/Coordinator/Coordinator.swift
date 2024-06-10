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
    func showActiveGame(game: GameModel)
    func showGameDeteil(game: GameModel)
    func showCoachDeteil(coach: CoachModel)
    func showPlanerCreation()
    func showPlanerDeteil(planner: PlannerModel)
    func showFavorites()
    func showBestPractice()
    func showBestPracticeDeteil(model: PracticeModel)
    func popToMain()
    func popOneScreenBack()
//    func hidePopUpScreens()
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
        let viewModel = PreloaderViewModel(coordinator: self)
        let preloaderVC = PreloaderVC(viewModel: viewModel)
        navigationController.pushViewController(preloaderVC, animated: true)
    }
    
    func showOnBoarding() {
        let viewModel = OnboardingViewModel(coordinator: self)
        let onboardingVC = OnboardingVC(viewModel: viewModel)
        navigationController.pushViewController(onboardingVC, animated: true)
    }
    
    func showMainScreen() {
        let viewModel = TabViewModel(coordinator: self)
        let tabViewVC = TabViewVC(viewModel: viewModel)
        navigationController.pushViewController(tabViewVC, animated: true)
    }
    
    
    func showProfileScreen() {
        let viewModel = UserStatsViewModel(coordinator: self)
        let userStatsVC = UserStatsVC(viewModel: viewModel)
        navigationController.pushViewController(userStatsVC, animated: true)
    }
    

    
    func showTermsPolicy(type: TermsPrivacyType) {
        let viewModel = TermsAndPrivacyViewModel(coordinator: self, termsPrivacy: type)
        let policyTermsVC = PolicyTermsVC(viewModel: viewModel)
        navigationController.pushViewController(policyTermsVC, animated: true)
    }
    
    func showGameCreation() {
        let viewModel = GamesCreationViewModel(coordinator: self)
        let gamesVC = GamesCreationVC(viewModel: viewModel)
        navigationController.pushViewController(gamesVC, animated: true)
    }
    
    func showActiveGame(game: GameModel) {
        let viewModel = GameActiveViewModel(coordinator: self, game: game)
        let activeGameVC = GameActiveScreenVC(viewModel: viewModel)
        navigationController.pushViewController(activeGameVC, animated: true)
    }
    
    func showGameDeteil(game: GameModel) {
        let viewModel = GameDeteilViewModel(coordinator: self, model: game)
        let gameDeteilVC = GameDeteilVC(viewModel: viewModel)
        navigationController.pushViewController(gameDeteilVC, animated: true)
    }
    
    func showCoachDeteil(coach: CoachModel) {
        let viewModel = CoachDetailViewModel(coordinator: self, model: coach)
        let coachDeteilVC = CoachDeteilVC(viewModel: viewModel)
        navigationController.pushViewController(coachDeteilVC, animated: true)
    }
    
    func showPlanerCreation() {
        let viewModel = PlannerCreationViewModel(coordinator: self)
        let plannerVC = PlannerCreationVC(viewModel: viewModel)
        navigationController.pushViewController(plannerVC, animated: true)
    }
    
    func showPlanerDeteil(planner: PlannerModel) {
        let viewModel = PlannerDeteilViewModel(coordinator: self, planner: planner)
        let plannerDeteilVC = PlannerDeteilVC(viewModel: viewModel)
        navigationController.pushViewController(plannerDeteilVC, animated: true)
    }
    
    func showFavorites() {
        let viewModel = SavedViewModel(coordinator: self)
        let savedVC = SavedVC(viewModel: viewModel)
        navigationController.pushViewController(savedVC, animated: true)
    }
    
    func showBestPractice() {
        let viewModel = BestPracticeViewModel(coordinator: self)
        let bestPracticeVC = BestPracticeDeteilVC(viewModel: viewModel)
        navigationController.pushViewController(bestPracticeVC, animated: true)
    }
    
    func showBestPracticeDeteil(model: PracticeModel) {
        let viewModel = PracticeDetailViewModel(coordinator: self, model: model)
        let deteilPracticeVC = PracticeDeteilVC(viewModel: viewModel)
        navigationController.pushViewController(deteilPracticeVC, animated: true)
    }
    
    
    func popOneScreenBack() {
        navigationController.popViewController(animated: true)
    }
    

    
    func popToMain() {
        for controller in self.navigationController.viewControllers as Array {
            if controller.isKind(of: TabViewVC.self) {
                self.navigationController.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
//    func hidePopUpScreens() {
//        navigationController.viewControllers.last?.dismiss(animated: true, completion: nil)
//    }
    
}
