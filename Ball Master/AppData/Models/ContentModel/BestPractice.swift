//
//  BestPractice.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 10.06.2024.
//

import Foundation



struct BestPracticeData {
    static let models: [PracticeModel] = [PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: "")]
    
    static let defence: [PracticeModel] = [PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: "")]
    
    static let attack : [PracticeModel] = [PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .attack, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .attack, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .attack, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .attack, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .attack, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .attack, content: "")]
    
    static let share: [PracticeModel] = [PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .share, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .share, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .share, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .share, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .share, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .share, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .share, content: "")]
    static let all: [PracticeModel] = defence + attack + share
}
