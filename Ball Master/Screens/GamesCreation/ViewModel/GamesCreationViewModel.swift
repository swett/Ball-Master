//
//  GamesCreationViewModel.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import Foundation


class GamesCreationViewModel: ObservableObject {
    @Published var isPopUpShowed: Bool = false
    @Published var teamOneName: String = ""
    @Published var teamOneDescription: String = ""
    @Published var teamTwoName: String = ""
    @Published var teamTwoDescription: String = ""
    @Published var isTeamOneNameInputed: Bool = false
    @Published var isTeamTwoNameInputed: Bool = false
    @Published var isAllInputed: Bool =  false
    
    @Published var firstLettersTeamOne: String = ""
    @Published var firstLettersTeamTwo: String = ""
    @Published var firstTeamColor: String = teamsColor.randomElement()!
    @Published var secondTeamColor: String = teamsColor.randomElement()!
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }
}


extension GamesCreationViewModel {
    func backToMain() {
        coordinator?.popOneScreenBack()
    }
}


extension GamesCreationViewModel {
    func textValidator(text: String) -> Bool {
          if text.count > 3 {
              return true
          } else {
              return false
          }
      }
    
    
    func checkIsAllInputed() {
            
            if isTeamOneNameInputed == true && isTeamTwoNameInputed == true {
                isAllInputed = true
            } else {
                isAllInputed = false
            }
        }
}


extension GamesCreationViewModel {
    func getFirstLetters() {
        
        firstLettersTeamOne = getLetters(words: teamOneName)
        firstLettersTeamTwo = getLetters(words: teamTwoName)
    }
    
 
}


func getLetters(words: String) -> String {
    
    let words = words.split(separator: " ")
    var firstLetters = ""

    for word in words {
        if let firstLetter = word.first {
            firstLetters.append(firstLetter)
        }
    }
    
    return firstLetters
}
