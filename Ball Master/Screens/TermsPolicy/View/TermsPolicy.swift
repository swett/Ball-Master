//
//  TermsPolicy.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import SwiftUI

struct TermsPolicy: View {
    @ObservedObject var viewModel : TermsAndPrivacyViewModel
    var body: some View {
        VStack(alignment: .leading) {
                    VStack {
                        HStack {
                            Button {
                                viewModel.backToMain()
                            } label: {
                                Image("backButton")
                                    .frame(width: 52, height: 52)
                            }
                            .padding(.leading, 16)
                            
//                            Text(viewModel.type == .terms ? "Terms" : "Policy")
//                                .font(.custom("Montserrat-Medium", size: 18))
//                                .foregroundColor(Color.theme.mainTextColor)
//                                .padding(.leading, 90.5)
                            Spacer()
                        }
                    }
                    .padding(.top, 50)
                    .padding(.bottom, 16)
                    .ignoresSafeArea(.all)
                    
                    ScrollView(showsIndicators: false) {
                        Text(viewModel.type == .terms ? viewModel.textTerms : viewModel.textPrivacy)
                            .padding(.all)
                            .font(.custom("Montserrat-Medium", size: 16))
                            .foregroundColor(.theme.mainTextColor)
                    }
                    .background(Color.theme.backgroundColor)
                    .padding(.top, -50)
                }
                .background(Color.theme.backgroundColor)
//                .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    TermsPolicy(viewModel: TermsAndPrivacyViewModel(termsPrivacy: .terms))
}
