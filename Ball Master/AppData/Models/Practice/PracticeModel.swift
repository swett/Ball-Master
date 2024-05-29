//
//  PracticeModel.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import Foundation


struct PracticeModel: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    let name: String
    let image: String
    let type: PracticeType
    let content: String
}
