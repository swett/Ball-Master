//
//  OnboardingView.swift
//  Ball Master
//
//  Created by admin on 24.05.2024.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    var body: some View {
        ZStack {
            Image("on")
                .resizable()
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                Text("Take your basketball career to the next level")
                {
                    string in
                    if let range = string.range(of: "basketball career") {
                        string[range].foregroundColor = Color.theme.buttonColor
                    }
                }
                .foregroundStyle(Color.theme.mainTextColor)
                .font(.custom("Sombra-Black", size: 34))
                .multilineTextAlignment(.center)
                .lineSpacing(15)
                .padding(.horizontal)
                .padding(.bottom)
                Text("Train like a pro and optimize your skills to improve your game on the court")
                    .foregroundStyle(Color.theme.deteilsTextColor)
                    .font(.custom("Sombra-Medium", size: 17))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 54)
                Button {
                    viewModel.openMainScreen()
                } label: {
                    Text("Get Started")
                        .foregroundStyle(Color.theme.buttonTextColor)
                        .font(.custom("Sombra-Black", size: 15))
                        .frame(width: 358, height: 50, alignment: .center)
                        .background(Color.theme.buttonColor)
                        .cornerRadius(28)
                    
                }
            }
        }
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
