//
//  GamesView.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import SwiftUI

struct GamesView: View {
    @ObservedObject var viewModel: GamesViewModel
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    GamesView(viewModel: GamesViewModel())
}
