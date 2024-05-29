//
//  GamesCreationView.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import SwiftUI

struct GamesCreationView: View {
    @ObservedObject var viewModel: GamesCreationViewModel
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                header
                main
            }
        }
    }
}

#Preview {
    GamesCreationView(viewModel: GamesCreationViewModel())
}

extension GamesCreationView {
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

extension GamesCreationView {
    private var main: some View {
        ScrollView {
            VStack {
                HStack {
                    Divider()
                        .frame(width: 4, height: 28)
                        .background(Color.theme.buttonColor)
                        .cornerRadius(10)
                    Text("First Team")
                        .font(.custom("Sombra-Medium", size: 24))
                        .foregroundStyle(Color.theme.mainTextColor)
                    Spacer()
                }
                .padding(.horizontal, 16)
                HStack {
                    Text("Enter Team Name")
                        .foregroundColor(.theme.mainTextColor)
                        .font(.custom("Sombra-Medium", size: 17))
                        .padding(.leading, 16)
                    Spacer()
                }
                .padding(.top)
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(hex: "#12171B"))
                    .padding(.horizontal, 16)
                    .frame(height: 44)
                    .overlay {
                        TextField("Enter the name for your set", text: $viewModel.teamOneName)
                            .foregroundColor(.theme.mainTextColor)
                            .font(.custom("Montserrat-Regular", size: 17))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 11)
                            .onChange(of: viewModel.teamOneName) { newValue in
                                let result = viewModel.textValidator(text: newValue)
                                viewModel.isTeamOneNameInputed = result
                                viewModel.checkIsAllInputed()
                            }
                            .clearButton(text: $viewModel.teamOneName)
                    }
                HStack {
                    Text("Enter Team Description")
                        .foregroundColor(.theme.mainTextColor)
                        .font(.custom("Sombra-Medium", size: 17))
                        .padding(.leading, 16)
                    Text("(Optional)")
                        .foregroundColor(.theme.deteilsTextColor)
                        .font(.custom("Montserrat-Medium", size: 13))
                    Spacer()
                }
                .padding(.top)
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(hex: "#12171B"))
                    .padding(.horizontal, 16)
                    .frame(height: 128)
                    .overlay(alignment: .top) {
                        TextField("Enter the name for your set", text: $viewModel.teamOneDescription)
                            .foregroundColor(.theme.mainTextColor)
                            .font(.custom("Montserrat-Regular", size: 17))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 11)
                            .clearButton(text: $viewModel.teamOneDescription)
                    }
                
                HStack {
                    Divider()
                        .frame(width: 4, height: 28)
                        .background(Color.theme.buttonColor)
                        .cornerRadius(10)
                    Text("Second Team")
                        .font(.custom("Sombra-Medium", size: 24))
                        .foregroundStyle(Color.theme.mainTextColor)
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top, 20)
                HStack {
                    Text("Enter Team Name")
                        .foregroundColor(.theme.mainTextColor)
                        .font(.custom("Sombra-Medium", size: 17))
                        .padding(.leading, 16)
                    Spacer()
                }
                .padding(.top)
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(hex: "#12171B"))
                    .padding(.horizontal, 16)
                    .frame(height: 44)
                    .overlay {
                        TextField("Enter the name for your set", text: $viewModel.teamTwoName)
                            .foregroundColor(.theme.mainTextColor)
                            .font(.custom("Montserrat-Regular", size: 17))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 11)
                            .onChange(of: viewModel.teamTwoName) { newValue in
                                let result = viewModel.textValidator(text: newValue)
                                viewModel.isTeamTwoNameInputed = result
                                viewModel.checkIsAllInputed()
                            }
                            .clearButton(text: $viewModel.teamOneName)
                    }
                HStack {
                    Text("Enter Team Description")
                        .foregroundColor(.theme.mainTextColor)
                        .font(.custom("Sombra-Medium", size: 17))
                        .padding(.leading, 16)
                    Text("(Optional)")
                        .foregroundColor(.theme.deteilsTextColor)
                        .font(.custom("Montserrat-Medium", size: 13))
                    Spacer()
                }
                .padding(.top)
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(hex: "#12171B"))
                    .padding(.horizontal, 16)
                    .frame(height: 128)
                    .overlay(alignment: .top) {
                        TextField("Enter the name for your set", text: $viewModel.teamTwoDescription)
                            .foregroundColor(.theme.mainTextColor)
                            .font(.custom("Montserrat-Regular", size: 17))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 11)
                            .clearButton(text: $viewModel.teamTwoDescription)
                    }
                Spacer()
                Button {
                    withAnimation(.smooth) {
    //                    viewModel.isTextViewHidden.toggle()
                    }
                    
                } label: {
                    Text("Next")
                        .foregroundStyle(Color.theme.buttonTextColor)
                        .font(.custom("Sombra-Black", size: 15))
                        .frame(width: 358, height: 50)
                        .background(Color.theme.buttonColor)
                        .cornerRadius(30)
                }
                .opacity(!viewModel.isAllInputed ? 0.5 : 1)
                .disabled(!viewModel.isAllInputed)
            }
        }
        
    }
}
