//
//  BestPracticeViewModel.swift
//  Ball Master
//
//  Created by admin on 28.05.2024.
//

import Foundation


class BestPracticeViewModel: ObservableObject {
    @Published var selectedIndex: Int = 0
    @Published var practiceArray: [PracticeModel] = []
    @Published var sortedPractice: [PracticeModel] = []
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil) {
        self.coordinator = coordinator
        self.sortStrategy()
    }
}


extension BestPracticeViewModel {
    func backToMain() {
        coordinator?.popOneScreenBack()
    }
    
    func showPracticeDeteil(model: PracticeModel) {
        coordinator?.showBestPracticeDeteil(model: model)
    }
}


extension BestPracticeViewModel {
    func sortStrategy() {
           switch selectedIndex {
           case 0: sortedPractice = BestPracticeData.all
           case 1: sortedPractice = BestPracticeData.defence
           case 2: sortedPractice = BestPracticeData.attack
           case 3: sortedPractice = BestPracticeData.share
           default: break
           }
       }
}
