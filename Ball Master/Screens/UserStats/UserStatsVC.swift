//
//  UserStatsVC.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 05.06.2024.
//

import UIKit
import SwiftUI
class UserStatsVC: UIHostingController<UserStatsView> {

    var viewModel: UserStatsViewModel
    
    init(viewModel: UserStatsViewModel) {
        self.viewModel = viewModel
        super.init(rootView: UserStatsView(viewModel: viewModel))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

