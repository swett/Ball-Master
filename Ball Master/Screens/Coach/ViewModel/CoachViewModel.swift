//
//  CoachViewModel.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import Foundation


class CoachViewModel: ObservableObject {
    var coaches: [CoachModel] = [CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy"),CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy"),CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy"),CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy"),CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy"),CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy"),CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy"),CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: "", strategyName: "", strategyDescription: "Explore Coach Strategy")]
    var view: TabViewVC?
    var saveHandler: (_ index: Int) -> Void = {index in}
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil, view: TabViewVC? = nil) {
        self.coordinator = coordinator
        self.view = view
        self.bind()
    }
}



extension CoachViewModel {
    func bind() {
        saveHandler = { index in
            AppData.shared.addStrategyToSavedStrategy(model: self.coaches[index])
        }
    }
}
