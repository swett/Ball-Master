//
//  TeamModel.swift
//  Ball Master
//
//  Created by admin on 04.06.2024.
//

import Foundation


struct TeamModel: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    let name: String
    let description: String
    let color: String
}
