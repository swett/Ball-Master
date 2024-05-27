//
//  GoachView.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import SwiftUI

struct CoachView: View {
    @ObservedObject var viewModel: CoachViewModel
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    CoachView(viewModel: CoachViewModel())
}
