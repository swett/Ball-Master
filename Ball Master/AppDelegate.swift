//
//  AppDelegate.swift
//  Ball Master
//
//  Created by admin on 24.05.2024.
//

import UIKit
import FirebaseCore
import OneSignalFramework
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: Coordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        coordinator = Coordinator(navigationController: NavigationVC())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator?.rootViewController
        window?.makeKeyAndVisible()
        //        FirebaseApp.configure()
        
        //        // Remove this method to stop OneSignal Debugging
           //          OneSignal.Debug.setLogLevel(.LL_VERBOSE)
           //
           //          // OneSignal initialization
           //          OneSignal.initialize("YOUR_ONESIGNAL_APP_ID", withLaunchOptions: launchOptions)
           //
           //          // requestPermission will show the native iOS notification permission prompt.
           //          // We recommend removing the following code and instead using an In-App Message to prompt for notification permission
           //          OneSignal.Notifications.requestPermission({ accepted in
           //            print("User accepted notifications: \(accepted)")
           //          }, fallbackToSettings: true)
           
           // Login your customer with externalId
           // OneSignal.login("EXTERNAL_ID")
        
        coordinator?.showPreloader()
        
        return true
    }
    
    
    
    
}

