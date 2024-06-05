//
//  SavedVC.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 05.06.2024.
//

import UIKit
import SwiftUI
class SavedVC: UIHostingController<SavedView> {

    var viewModel: SavedViewModel
    
    init(viewModel: SavedViewModel) {
        self.viewModel = viewModel
        super.init(rootView: SavedView(viewModel: viewModel))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

