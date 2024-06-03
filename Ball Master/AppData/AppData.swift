//
//  AppData.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import Foundation

class AppData: NSObject {
    
    
    fileprivate override init() {
        super.init()
        if !UserDefaults.standard.bool(forKey: "isDataLoaded"){
            defaultLoad()
            UserDefaults.standard.set(true, forKey: "isDataLoaded")
        } else {
            loadData()
        }
    }
    
    
    var defaultData: UserDefaults = UserDefaults.standard
    
    
    var isNotifications: Bool {
        get {
            return defaultData.bool(forKey: Keys.notifications)
        }
        set {
            defaultData.set(newValue, forKey: Keys.notifications)
        }
    }
    
    var isVibration: Bool {
        get {
            return defaultData.bool(forKey: Keys.vibration)
        }
        set {
            defaultData.set(newValue, forKey: Keys.vibration)
        }
    }
    var plannerArray: [PlannerModel] = []
    var savedCoaches: [CoachModel] = []
    static let shared: AppData = AppData()
}


extension AppData {
    func defaultLoad() {
        
    }
    
    func loadData() {
        
    }
}




extension AppData {
    func addStrategyToSavedStrategy(model: CoachModel) {
        if let index = savedCoaches.firstIndex(where: { $0.id == model.id }) {
            savedCoaches.remove(at: index)
        } else {
            savedCoaches.append(model)
        }
        savedCoach()
    }
    
    func savedCoach() {
        let encoder = JSONEncoder()
        let key = Keys.savedStrategy
        guard let data = try? encoder.encode(savedCoaches) else {
            return
        }
        defaultData.set(data, forKey: key)
    }
    
    func getSavedCoaches() -> [CoachModel] {
        let decoder = JSONDecoder()
        let key = Keys.savedStrategy
        savedCoaches = try! decoder.decode([CoachModel].self, from: defaultData.data(forKey: key)!)
        return savedCoaches
    }
    
    func savePlanners() {
        let encoder = JSONEncoder()
        let key = Keys.savedPlanners
        guard let data = try? encoder.encode(plannerArray) else {
            return
        }
        defaultData.set(data, forKey: key)
    }
    
    func getSavedPlanners() -> [PlannerModel] {
        let decoder = JSONDecoder()
        let key = Keys.savedPlanners
        plannerArray = try! decoder.decode([PlannerModel].self, from: defaultData.data(forKey: key)!)
        return plannerArray
    }
    
}
