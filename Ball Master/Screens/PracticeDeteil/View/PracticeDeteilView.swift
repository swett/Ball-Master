//
//  PracticeDeteilView.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import SwiftUI

struct PracticeDeteilView: View {
    @ObservedObject var viewModel: PracticeDetailViewModel
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            Image("\(viewModel.model.image)")
                .resizable()
                .scaledToFill()
                .frame(width: DeviceType.IS_SMALL ? 378 : 400,height: 333)
                .ignoresSafeArea(.all)
                .overlay {
                    Color(hex: "#12171B").opacity(0.8)
                        .ignoresSafeArea(.all)
                }
            LinearGradient(colors: [Color(hex: "#070F15").opacity(0),Color(hex: "#070F15")], startPoint: .top, endPoint: .bottom)
                .frame(height: 247)
                .padding(.top, 90)
                
            VStack {
                header
                main
                    .padding(.top, 120)
            }
            
        }
    }
}

#Preview {
    PracticeDeteilView(viewModel: PracticeDetailViewModel(model: PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: coachTextStrategy)))
}


extension PracticeDeteilView {
    private var header: some View {
        HStack {
            Button {
                viewModel.backToMain()
            } label: {
                Image("backButton")
                    .frame(width: 52, height: 52)
            }
            .padding(.leading, 16)
            Spacer()
        }
    }
}


extension PracticeDeteilView {
    private var main: some View {
        VStack {
            HStack {
                Text("\(viewModel.model.name)")
                    .foregroundStyle(Color.theme.mainTextColor)
                    .font(.custom("Sombra-Medium", size: 24))
                Spacer()
            }
            .padding(.leading, 16)
            
            HStack {
                Text("#\(viewModel.model.type.rawValue.lowercased())")
                    .foregroundStyle(Color.theme.buttonColor)
                    .frame(width: 83, height: 33)
                    .background(Color.theme.buttonColor.opacity(0.1))
                    .cornerRadius(22)
                Spacer()
            }
            .padding(.leading, 16)
            .padding(.top, 10)
            HStack {
                Text("Deteil")
                    .foregroundStyle(Color.theme.mainTextColor)
                    .font(.custom("Sombra-Medium", size: 24))
                Spacer()
            }
            .padding(.leading, 16)
            .padding(.top, 10)
            ScrollView(showsIndicators: false) {
                Text("\(viewModel.model.content)")
                    .foregroundStyle(Color.theme.deteilsTextColor)
                    .font(.custom("Montserrat-Medium", size: 18))
            }
            .padding(.horizontal, 16)
        }
    }
}
