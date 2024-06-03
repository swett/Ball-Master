//
//  GameCreationPopUp.swift
//  Ball Master
//
//  Created by admin on 30.05.2024.
//

import SwiftUI

struct GameCreationPopUp: View {
    @EnvironmentObject var viewModel: GamesCreationViewModel
    var body: some View {
        VStack {
            Text("Ready To Start?")
                .font(.custom("Sombra-Black", size: 24))
                .foregroundStyle(Color.theme.mainTextColor)
            HStack {
                VStack {
                    Circle()
                        .frame(width: 44, height: 44)
                        .foregroundStyle(Color(hex: viewModel.firstTeamColor))
                        .overlay {
                            Text("\(viewModel.firstLettersTeamOne)")
                                .font(.custom("Sombra-Medium", size: 13))
                                .foregroundStyle(Color.theme.buttonTextColor)
                        }
                    Text("Some Team Name")
                        .foregroundStyle(Color.theme.mainTextColor)
                        .font(.custom("Sombra-Medium", size: 14))
                        .multilineTextAlignment(.center)
                        .frame(width: 80)
                }
                Spacer()
                Text("VS")
                    .font(.custom("Sombra-Black", size: 24))
                    .foregroundStyle(Color.theme.mainTextColor)
                Spacer()
                VStack {
                    Circle()
                        .frame(width: 44, height: 44)
                        .foregroundStyle(Color(hex: viewModel.secondTeamColor))
                        .overlay {
                            Text("\(viewModel.firstLettersTeamTwo)")
                                .font(.custom("Sombra-Medium", size: 13))
                                .foregroundStyle(Color.theme.buttonTextColor)
                        }
                    Text("Some Team Name")
                        .foregroundStyle(Color.theme.mainTextColor)
                        .font(.custom("Sombra-Medium", size: 14))
                        .multilineTextAlignment(.center)
                        .frame(width: 80)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)
            Button {
                withAnimation(.smooth) {
                    viewModel.isPopUpShowed.toggle()
                }
            } label: {
                Text("Start")
                    .foregroundStyle(Color.theme.buttonTextColor)
                    .font(.custom("Sombra-Black", size: 15))
                    .frame(width: 282, height: 50)
                    .background(Color.theme.buttonColor)
                    .cornerRadius(30)
            }
            .padding(.top, 30)
            Button {
                withAnimation(.smooth) {
                    viewModel.isPopUpShowed.toggle()
                }
            } label: {
                Text("Cancel")
                    .foregroundStyle(Color.theme.buttonColor)
                    .font(.custom("Sombra-Black", size: 15))
                    .frame(width: 282, height: 50)
                    .background(Color.clear)
                    .cornerRadius(30)
            }
            .roundedCornerWithBorder(lineWidth: 1, borderColor: Color.theme.buttonColor, radius: 30, corners: .allCorners)
        }
        .frame(width: 330, height: 345)
        .background(Color(hex: "#18191D"))
        .cornerRadius(35)
    }
}

#Preview {
    GameCreationPopUp()
        .environmentObject(GamesCreationViewModel())
}
