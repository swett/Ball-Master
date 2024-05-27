//
//  TabViewModel.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import Foundation
enum Tab: Int, CaseIterable, Identifiable {
  case games = 0, coach = 1, planner = 2, settings = 3
    var title: String{
            switch self {
            case .coach:
                return ""
            case .games:
                return ""
            case .planner:
                return ""
            case .settings:
                return ""
            }
        }
        
        var iconName: String{
            switch self {
            case .coach:
                return "Home"
            case .games:
                return "Favorite"
            case .planner:
                return "Profile"
            case .settings:
                return "Settings"
            }
        }
    var id: Self { self }
 }



class TabViewModel: ObservableObject {
    
    var gamesViewModel: GamesViewModel?
    var settingsViewModel: SettingsViewModel?
    var coachViewModel: CoachViewModel?
    var plannerViewModel: PlannerViewModel?
    @Published var selectedTab: Tab = .games
    @Published var previousTab: Tab = .games
    @Published var showingBottomSheet: Bool = false
    var creationCreditHandler: () -> Void = {}
    var cancelHandler: () -> Void = {}
    var view: TabViewVC?
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil) {
        self.coordinator = coordinator
        self.updateModels()
    }
}


extension TabViewModel {
    func updateModels() {
        gamesViewModel = GamesViewModel(coordinator: self.coordinator, view: view)
        settingsViewModel = SettingsViewModel(coordinator: self.coordinator, view: view)
        coachViewModel = CoachViewModel(coordinator: self.coordinator, view: view)
        plannerViewModel = PlannerViewModel(coordinator: self.coordinator, view: view)
    }
}
