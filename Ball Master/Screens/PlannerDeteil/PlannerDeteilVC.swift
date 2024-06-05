//
//  PlannerDeteilVC.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 05.06.2024.
//

import UIKit
import SwiftUI
class PlannerDeteilVC: UIHostingController<PlannerDeteilView> {

    var viewModel: PlannerDeteilViewModel
    
    init(viewModel: PlannerDeteilViewModel) {
        self.viewModel = viewModel
        super.init(rootView: PlannerDeteilView(viewModel: viewModel))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
