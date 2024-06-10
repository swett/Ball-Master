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
    var userStat: User = User()
    var plannerArray: [PlannerModel] = []
    var gamesArray:[GameModel] = []
    var savedCoaches: [CoachModel] = []
    var savedGames: [GameModel] = []
    static let shared: AppData = AppData()
}


extension AppData {
    func defaultLoad() {
//        saveUserStats()
//        saveGames()
//        savedCoach()
//        savePlanners()
//        saveGamesToFavorite()
    }
    
    func loadData() {
//        userStat = getUserStats()
//        plannerArray = getSavedPlanners()
//        gamesArray = getGames()
//        savedCoaches = getSavedCoaches()
//        savedGames = getSavedGames()
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
    
    func saveUserStats() {
        let encoder = JSONEncoder()
        let key = Keys.userStats
        guard let data = try? encoder.encode(userStat) else {
            return
        }
        defaultData.set(data, forKey: key)
    }
    
    func getUserStats() -> User {
        let decoder = JSONDecoder()
        let key = Keys.userStats
        userStat = try! decoder.decode(User.self, from: defaultData.data(forKey: key)!)
        return userStat
    }
    
    func saveGames() {
        let encoder = JSONEncoder()
        let key = Keys.gamesAll
        guard let data = try? encoder.encode(gamesArray) else {
            return
        }
        defaultData.set(data, forKey: key)
    }
    
    func getGames() -> [GameModel] {
        let decoder = JSONDecoder()
        let key = Keys.gamesAll
        gamesArray = try! decoder.decode([GameModel].self, from: defaultData.data(forKey: key)!)
        return gamesArray
    }
    
    func saveGamesToFavorite() {
        let encoder = JSONEncoder()
        let key = Keys.gamesSaved
        guard let data = try? encoder.encode(savedGames) else {
            return
        }
        defaultData.set(data, forKey: key)
    }
    
    func getSavedGames() -> [GameModel] {
        let decoder = JSONDecoder()
        let key = Keys.gamesSaved
        savedGames = try! decoder.decode([GameModel].self, from: defaultData.data(forKey: key)!)
        return savedGames
    }
    
}
