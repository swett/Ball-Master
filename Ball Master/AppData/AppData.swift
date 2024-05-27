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
//    var userStat: UserStats = UserStats(userID: UUID().uuidString, userJoinDate: Date(), lastTrainingDate: Date())
//    var userSets: [SetModel] = []
//    var savedSets: [SetModel] = []
//    var savedStrategy: [Strategy] = []
    static let shared: AppData = AppData()
}


extension AppData {
    func defaultLoad() {

    }
    
    func loadData() {

    }
}

