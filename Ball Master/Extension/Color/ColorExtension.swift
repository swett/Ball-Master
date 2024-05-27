//
//  ColorExtension.swift
//  Ball Master
//
//  Created by admin on 24.05.2024.
//

import Foundation
import UIKit
import SwiftUI


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    static var mainBgColor: UIColor {
        return UIColor(hexString: "#181818")
    }
    
    static var tabBgColor: UIColor {
        return UIColor(hexString: "#081E42")
    }
    
    static var backgroundColorForNavigation: UIColor {
        return UIColor(hexString: "#282828")
    }
    
    static var secondBgColor: UIColor {
        return UIColor(hexString: "#1F1D31")
    }
    
    static var mainTextColor: UIColor {
        return UIColor(hexString: "#FFFFFF")
    }
    static var mainDetailsColor: UIColor {
        return UIColor(hexString: "#C0C0C0")
    }
    static var mainButtonColor: UIColor {
        return UIColor(hexString: "#202020")
    }
    static var darkTextColor: UIColor {
        return UIColor(hexString: "#1D1D1D")
    }
}




extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

extension Color {
    static let theme = ColorTheme()
}


struct ColorTheme {
    let mainTextColor = Color(hex: "#FFFFFF")
    let pinkText = Color(hex:"#FF6897")
    let deteilsTextColor = Color(hex: "#545C62")
    let buttonColor = Color(hex: "#D0EA59")
    let buttonTextColor = Color(hex: "#000000")
    let backgroundColor = Color(hex: "#070F15")
}
