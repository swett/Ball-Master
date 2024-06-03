//
//  LineModel.swift
//  Ball Master
//
//  Created by admin on 30.05.2024.
//

import Foundation
import SwiftUI


struct Line: Identifiable {
    var points: [CGPoint]
    var color: Color
    var lineWidth: CGFloat
    let id = UUID()
}
