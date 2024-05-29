//
//  SavedView.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import SwiftUI

struct SavedView: View {
    @ObservedObject var viewModel: SavedViewModel
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                header
                selectionCell
                    .padding(.top, 10)
                if viewModel.selectedIndex == 0 {
                    coaches
                } else {
                    games
                }
            }
        }
    }
}

#Preview {
    SavedView(viewModel: SavedViewModel())
}


extension SavedView {
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


extension SavedView {
    private var selectionCell: some View {
        VStack {
            HStack{
                Text("Favourites")
                    .font(.custom("Sombra-Medium", size: 28))
                    .foregroundStyle(Color.theme.mainTextColor)
                Spacer()
            }
            .padding(.horizontal, 16)
            HStack{
                Text("Your saved games and coaches will appear here.")
                    .font(.custom("Sombra-Thin", size: 15))
                    .foregroundStyle(Color.theme.deteilsTextColor)
                Spacer()
            }
            .padding(.horizontal, 16)
            HStack {
                Button {
                    withAnimation(.easeInOut) {
                        viewModel.selectedIndex = 0
                    }
                    
                } label: {
                    Text("Coaches")
                        .font(.custom("Sombra-Medium", size: 14))
                        .padding(.vertical, 18)
                        .padding(.horizontal, 40)
                        .foregroundColor(viewModel.selectedIndex == 0 ? .white : .theme.deteilsTextColor)
                        .background(viewModel.selectedIndex == 0 ? Color(hex: "#23272B"): .clear)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                
                Button {
                    withAnimation(.easeInOut) {
                        viewModel.selectedIndex = 1
                    }
                } label: {
                    Text("Games")
                        .font(.custom("Sombra-Medium", size: 14))
                        .padding(.vertical, 18)
                        .padding(.horizontal, 40)
                        .foregroundColor(viewModel.selectedIndex == 1 ? .white : .theme.deteilsTextColor)
                        .background(viewModel.selectedIndex == 1 ? Color(hex: "#23272B"): .clear)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 10)
        }
    }
}


extension SavedView {
    private var coaches: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(Array(viewModel.coaches.enumerated()), id: \.element) {
                    index,item in
                    CoachCell(model: item, index: index, saveCoach: viewModel.saveHandler)
                }
            }
        }
    }
}

extension SavedView {
    private var games: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.games, id: \.self) {
                    item in
                    GameCell()
                }
            }
        }
    }
}
