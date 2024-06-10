//
//  BestPractice.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 10.06.2024.
//

import Foundation

let modelsImage: [String] = ["best1","best2","best3","best4","best5","best6","best7","best8","best9","best10"]

struct BestPracticeData {
    static let models: [PracticeModel] = [PracticeModel(name: "Arm strengthening", image: modelsImage.randomElement()!, type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .defence, content: "")]
    
    static let defence: [PracticeModel] = [PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .defence, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .defence, content: "")]
    
    static let attack : [PracticeModel] = [PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .attack, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .attack, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .attack, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .attack, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .attack, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .attack, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .attack, content: "")]
    
    static let share: [PracticeModel] = [PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .share, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .share, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .share, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .share, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .share, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .share, content: ""),PracticeModel(name: "Arm and abdominal strengthening", image: modelsImage.randomElement()!, type: .share, content: "")]
    static let all: [PracticeModel] = defence + attack + share
}
