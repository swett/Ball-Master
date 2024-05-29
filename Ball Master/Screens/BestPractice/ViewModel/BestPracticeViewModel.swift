//
//  BestPracticeViewModel.swift
//  Ball Master
//
//  Created by admin on 28.05.2024.
//

import Foundation


class BestPracticeViewModel: ObservableObject {
    @Published var selectedIndex: Int = 0
    @Published var practiceArray: [PracticeModel] = [PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: "")]
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil) {
        self.coordinator = coordinator

    }
}


extension BestPracticeViewModel {
    func backToMain() {
        coordinator?.popOneScreenBack()
    }
    
    func showPracticeDeteil() {
        // add coordinator for practice
    }
}


extension BestPracticeViewModel {
    func sortStrategy() {
           switch selectedIndex {
//           case 0: sortedStrategy = AmericanStrategies.strategies
//           case 1: sortedStrategy = BasketballStrategies.strategies
//           case 2: sortedStrategy = CricketStrategies.strategies
//           case 3: sortedStrategy = FootballStrategies.strategies
           default: break
           }
       }
}
