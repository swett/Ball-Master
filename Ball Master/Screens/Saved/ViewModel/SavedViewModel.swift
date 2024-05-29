//
//  SavedViewModel.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import Foundation


class SavedViewModel: ObservableObject {
    @Published var coaches: [CoachModel] = [CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy"),CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy"),CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy"),CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy"),CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy"),CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy"),CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy"),CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy")]
    @Published var games: [String] = ["1","2","3","4","5","6"]
    @Published var selectedIndex: Int = 0
    var saveHandler: (_ index: Int) -> Void = {index in}
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil) {
        self.coordinator = coordinator
        self.bind()
    }
}


extension SavedViewModel {
    func backToMain() {
        coordinator?.popOneScreenBack()
    }
    
}


extension SavedViewModel {
    func bind() {
        saveHandler = { index in
            AppData.shared.addStrategyToSavedStrategy(model: self.coaches[index])
        }
    }
}
