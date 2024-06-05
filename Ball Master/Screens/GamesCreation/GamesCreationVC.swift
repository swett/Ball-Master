//
//  GamesCreationVC.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 05.06.2024.
//

import UIKit
import SwiftUI
class GamesCreationVC: UIHostingController<GamesCreationView> {

    var viewModel: GamesCreationViewModel
    
    init(viewModel: GamesCreationViewModel) {
        self.viewModel = viewModel
        super.init(rootView: GamesCreationView(viewModel: viewModel))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
