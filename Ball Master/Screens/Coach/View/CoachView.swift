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
        ZStack(alignment: .top) {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                header
                main
                    .padding(.top, 10)
            }
        }
    }
}

#Preview {
    CoachView(viewModel: CoachViewModel())
}


extension CoachView {
    private var header: some View {
        VStack {
            HStack {
                Text("Coach")
                     .font(.custom("Sombra-Black", size: 32))
                     .foregroundStyle(Color.theme.mainTextColor)
                Spacer()
            }
            .padding(.horizontal, 16)
            if viewModel.savedCoachesUpdates.isEmpty {
                VStack {
                    Text("You haven`t saved any coach yet, start right now!")
                        .frame(width: 247)
                        .font(.custom("Montserrat-Medium", size: 14))
                        .foregroundStyle(Color.theme.mainTextColor).opacity(0.12)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 358, height: 64)
                .foregroundStyle(Color.clear)
                .roundedCornerWithBorder(lineWidth: 1, borderColor: .white.opacity(0.12), radius: 15, corners: [.allCorners])
            } else {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.savedCoachesUpdates, id: \.self) {
                            item in
                            VStack {
                                Circle()
                                    .stroke(Color.theme.buttonColor,lineWidth: 1)
                                    .frame(width: 54, height: 54)
                                    .overlay {
                                        Image("\(item.image)")
                                            .resizable()
                                            .frame(width: 42, height: 42)
                                            .cornerRadius(30)
                                    }
                                Text("\(item.name)")
                                    .font(.custom("Sombra-Black", size: 14))
                                    .foregroundStyle(Color.theme.mainTextColor)
                                    .frame(width: 80)
                                    .multilineTextAlignment(.center)
                            }
                            .onTapGesture {
                                viewModel.openDeteilCoach(model: item)
                            }
                        }
                    }
                   
                }
                .frame(height: 96)
                .padding(.horizontal)
            }
        }
    }
}


extension CoachView {
    private var main: some View {
        VStack {
            HStack {
                Text("All Coaches")
                    .font(.custom("Sombra-Black", size: 24))
                    .foregroundStyle(Color.theme.mainTextColor)
                Spacer()
            }
            .padding(.horizontal, 16)
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(Array(viewModel.coaches.enumerated()), id: \.element) {
                    index, item in
                    CoachCell(model: item, index: index, saveCoach: viewModel.saveHandler)
                        .onTapGesture {
                            viewModel.openDeteilCoach(model: item)
                        }
                }
                Spacer(minLength: 90)
            }
        }
    }
}
