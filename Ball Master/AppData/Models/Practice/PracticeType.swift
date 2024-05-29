//
//  PracticeType.swift
//  Ball Master
//
//  Created by admin on 28.05.2024.
//

import Foundation

enum PracticeType: String,Codable, CaseIterable, Hashable {
    case all = "All"
    case defence = "Defence"
    case attack = "Attack"
    case share = "Share"
}
