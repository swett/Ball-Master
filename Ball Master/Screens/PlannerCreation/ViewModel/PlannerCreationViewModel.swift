//
//  PlannerCreationViewModel.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import Foundation


class PlannerCreationViewModel: ObservableObject {
    @Published var isTextViewHidden: Bool = false
    @Published var plannerName: String = ""
    @Published var plannerDescription: String = ""
    @Published var isPlannerNameInputed: Bool = false
    @Published var isPlannerDescriptionInputed: Bool = false
    @Published var isAllInputed: Bool =  false
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
    
    
    func checkIsAllInputed() {
            
            if isPlannerNameInputed == true {
                isAllInputed = true
            } else {
                isAllInputed = false
            }
        }
}
