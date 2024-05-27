//
//  ImageExtension.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import Foundation
func getImageBySettingsName(name: String) -> String {
    switch name {
    case "Notification": return "notification"
    case "Vibration": return "vibration"
    case "Privacy Policy": return "privacy"
    case "Terms of Service": return "terms"
    case "Rate Us": return "rate"
    case "Feedback": return "feedback"
    case "Best Practice": return "bestPractice"
    default: break
    }
    return ""
}
