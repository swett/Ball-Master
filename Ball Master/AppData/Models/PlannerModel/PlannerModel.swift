//
//  PlannerModel.swift
//  Ball Master
//
//  Created by admin on 03.06.2024.
//

import Foundation


struct PlannerModel: Identifiable, Hashable, Codable {
    var id: UUID = UUID()
    let name: String
    let description: String
    let planImage: String
}
