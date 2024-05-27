//
//  PlannerView.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import SwiftUI

struct PlannerView: View {
    @ObservedObject var viewModel: PlannerViewModel
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    PlannerView(viewModel: PlannerViewModel())
}
