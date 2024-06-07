//
//  PlannerCreationViewModel.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import Foundation
import PencilKit

class PlannerCreationViewModel: ObservableObject {
    @Published var isTextViewHidden: Bool = false
    @Published var plannerName: String = ""
    @Published var plannerDescription: String = ""
    @Published var isPlannerNameInputed: Bool = false
    @Published var isPlannerDescriptionInputed: Bool = false
    @Published var isPlayerNameInputed: Bool = false
    @Published var isPlayerNumberInputed: Bool = false
    @Published var isAllInputed: Bool =  false
    @Published var isHideTip: Bool = false
    @Published var isDrawing: Bool = false
    @Published var isEraser: Bool = false
    @Published var isSheetShowed: Bool = false
    @Published var isShowAlert: Bool = false
    @Published var isShowCloseAlert: Bool = false
    @Published var isShowSaveAlert: Bool = false
    @Published var canvas = PKCanvasView()
    @Published var imageSnapShoot: UIImage?
//    @Published var drawingStates: [PKDrawing] = []
//    @Published var currentStateIndex: Int = -1
    @Published var selectedState: PlayerOrOpponent = .player
    @Published var playersArray: [PlannerPlayer] = []
    private let coordinator: CoordinatorProtocol?
    init(coordinator: CoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }
}


extension PlannerCreationViewModel {
    func backToMain() {
        coordinator?.popOneScreenBack()
    }
}


extension PlannerCreationViewModel {
    func textValidator(text: String) -> Bool {
          if text.count > 3 {
              return true
          } else {
              return false
          }
      }
    
    func textValidatorNumber(text: String) -> Bool {
          if text.count > 1 {
              return true
          } else {
              return false
          }
      }
    
    
    func checkIsAllInputed() {
            
            if isPlannerNameInputed == true {
                isAllInputed = true
            } else {
                isAllInputed = false
            }
        }
}



extension PlannerCreationViewModel {
    func addPlayerToView(name: String, number: String, type: PlayerOrOpponent) {
        let player = PlannerPlayer(name: name, number: number, type: type, position: CGPoint(x: 100, y: 150))
        
        playersArray.append(player)
    
    }
    
    func deletePlayerFromField(player: PlannerPlayer) {
        playersArray = playersArray.filter(){$0.id != player.id}
    }
}
