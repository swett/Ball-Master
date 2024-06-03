//
//  PlannerCreationViewModel.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import Foundation
import PencilKit

class PlannerCreationViewModel: ObservableObject {
    @Published var isTextViewHidden: Bool = true
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
    @Published var canvas = PKCanvasView()
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



//extension PlannerCreationViewModel {
//    func undo() {
//            guard currentStateIndex > 0 else { return }
//            currentStateIndex -= 1
//            canvas.drawing = drawingStates[currentStateIndex]
//        print(canvas.drawing)
//        }
//        
//        func redo() {
//            guard currentStateIndex < drawingStates.count - 1 else { return }
//            currentStateIndex += 1
//            canvas.drawing = drawingStates[currentStateIndex]
//        }
//        
//        func save() {
//            let image = canvas.drawing.image(from: canvas.bounds, scale: UIScreen.main.scale)
//            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//        }
//        
//        func saveCurrentState() {
//            if currentStateIndex < drawingStates.count - 1 {
//                drawingStates = Array(drawingStates.prefix(upTo: currentStateIndex + 1))
//            }
//            drawingStates.append(canvas.drawing)
//            currentStateIndex += 1
//        }
//}


extension PlannerCreationViewModel {
    func addPlayerToView(name: String, number: String, type: PlayerOrOpponent) {
        let player = PlannerPlayer(name: name, number: number, type: type)
        
        playersArray.append(player)
    
    }
    
    func deletePlayerFromField(player: PlannerPlayer) {
        playersArray = playersArray.filter(){$0.id != player.id}
    }
}
