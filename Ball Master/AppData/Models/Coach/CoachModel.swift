//
//  CoachModel.swift
//  Ball Master
//
//  Created by admin on 28.05.2024.
//

import Foundation

struct CoachModel: Codable, Identifiable, Hashable {
    var id = UUID()
    let image: String
    let clubIcon: [String]
    let name: String
    let content: String
    let strategyName: String
    let strategyDescription: String
}
