//
//  PlannerViewModel.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import Foundation


class PlannerViewModel: ObservableObject {
    @Published var plannerArrray: [PlannerModel] = []
    var planners: [PlannerModel] = AppData.shared.plannerArray
    private let coordinator: CoordinatorProtocol?
    var view: TabViewVC?
    init(coordinator: CoordinatorProtocol? = nil, view: TabViewVC? = nil) {
        self.coordinator = coordinator
        self.view = view
        plannerArrray = planners
    }
}



extension PlannerViewModel {
    func openPlanerCreation() {
        coordinator?.showPlanerCreation()
    }
    
    func openPlannerDeteil(model: PlannerModel) {
        coordinator?.showPlanerDeteil(planner: model)
    }
    
    func getPlannersArray() {
        planners = AppData.shared.plannerArray
        plannerArrray = planners
    }
}
