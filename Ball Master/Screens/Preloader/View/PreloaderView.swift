//
//  PreloaderView.swift
//  Ball Master
//
//  Created by admin on 24.05.2024.
//

import SwiftUI

struct PreloaderView: View {
    @ObservedObject var viewModel: PreloaderViewModel
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                Image("logo")
                
                Spacer()
                SpinnerView()
                Text("Wain a few second...")
                    .foregroundStyle(Color.theme.deteilsTextColor)
                    .font(.custom("Sombra-Thin", size: 14))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                viewModel.showOnboarding()
            }
        }
    }
}

#Preview {
    PreloaderView(viewModel: PreloaderViewModel())
}
