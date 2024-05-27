//
//  CoachViewModel.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import Foundation


class CoachViewModel: ObservableObject {
    private let coordinator: CoordinatorProtocol?
    var view: TabViewVC?
    init(coordinator: CoordinatorProtocol? = nil, view: TabViewVC? = nil) {
        self.coordinator = coordinator
        self.view = view
    }
}
