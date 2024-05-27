//
//  TextExtension.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import Foundation
import SwiftUI


extension Text {
    init(_ string: String, configure: ((inout AttributedString) -> Void)) {
        var attributedString = AttributedString(string) /// create an `AttributedString`
        configure(&attributedString) /// configure using the closure
        self.init(attributedString) /// initialize a `Text`
    }
}
