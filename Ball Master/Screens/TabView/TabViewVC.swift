//
//  TabViewVC.swift
//  Ball Master
//
//  Created by admin on 24.05.2024.
//

import SwiftUI
import UIKit

class TabViewVC: UIHostingController<TabViewBottom> {
    
    var viewModel: TabViewModel
    
    init(viewModel: TabViewModel) {
        self.viewModel = viewModel
        super.init(rootView: TabViewBottom(viewModel: viewModel))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.updateModels()
        // Do any additional setup after loading the view.
    }
}
