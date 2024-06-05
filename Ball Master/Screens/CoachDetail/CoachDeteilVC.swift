//
//  CoachDeteilVC.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 05.06.2024.
//

import UIKit
import SwiftUI
class CoachDeteilVC: UIHostingController<CoachDetailView> {

    var viewModel: CoachDetailViewModel
    
    init(viewModel: CoachDetailViewModel) {
        self.viewModel = viewModel
        super.init(rootView: CoachDetailView(viewModel: viewModel))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

