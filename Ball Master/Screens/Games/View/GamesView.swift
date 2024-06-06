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
        ZStack(alignment: .top) {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                header
                if viewModel.gamesArray.isEmpty {
                    emptyState
                        .padding(.top, 32)
                } else {
                    gamesState
                        .padding(.top, 32)
                }
            }
        }
        .onAppear {
            viewModel.adjustTimesOnAppear()
        }
    }
}

#Preview {
    GamesView(viewModel: GamesViewModel())
}


extension GamesView {
    private var header: some View {
        VStack {
            HStack {
                VStack {
                    Text("Ready to Start?")
                        .font(.custom("Sombra-Thin", size: 15))
                        .foregroundStyle(Color.theme.deteilsTextColor)
                    Text("Games")
                        .font(.custom("Sombra-Medium", size: 32))
                        .foregroundStyle(Color.theme.mainTextColor)
                }
                Spacer()
                Image("profile")
                    .resizable()
                    .frame(width: 44, height: 44)
            }
            .padding(.horizontal, 16)
            
            Button {
                viewModel.openCreationGame()
            } label: {
                HStack {
                    Image("plus")
                    Text("Add New Event")
                        .foregroundStyle(Color.theme.buttonTextColor)
                        .font(.custom("Sombra-Black", size: 15))
                }
                .frame(width: 358, height: 50)
                .background(Color.theme.buttonColor)
                .cornerRadius(30)
            }
            .padding(.top, 15)
        }
        
    }
}


extension GamesView {
    private var emptyState: some View {
        VStack {
            Text("You haven`t created any games yet, start right now!")
                .frame(width: 247)
                .font(.custom("Montserrat-Medium", size: 14))
                .foregroundStyle(Color.theme.mainTextColor).opacity(0.12)
                .multilineTextAlignment(.center)
        }
        .frame(width: 358, height: 64)
        .foregroundStyle(Color.clear)
        .roundedCornerWithBorder(lineWidth: 1, borderColor: .white.opacity(0.12), radius: 15, corners: [.allCorners])
        
        
    }
}


extension GamesView {
    private var gamesState: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.gamesArray, id: \.self) {
                    item in
                    GameCell(model: item)
                        .onTapGesture {
                            if item.isRunning {
                                viewModel.openActiveGameScreen(model: item)
                            } else {
                                viewModel.openGameDeteil(model: item)
                            }
                            
                        }
                }
            }
        }
    }
}
