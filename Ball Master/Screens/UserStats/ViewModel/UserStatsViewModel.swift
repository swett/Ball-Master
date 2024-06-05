//
//  UserStatsViewModel.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 05.06.2024.
//

import Foundation


class UserStatsViewModel: ObservableObject {
    var user: User = AppData.shared.userStat
    @Published var practiceArray: [PracticeModel] = [PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: "")]
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }
}


extension UserStatsViewModel {
    func backToMain() {
        coordinator?.popOneScreenBack()
    }
    
    func showPracticeDeteil(model: PracticeModel) {
        // add coordinator for practice
    }
}
