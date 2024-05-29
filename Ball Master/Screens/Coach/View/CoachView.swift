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
           
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0...4, id: \.self) {
                        item in
                        VStack {
                            Circle()
                                .stroke(Color.theme.buttonColor,lineWidth: 1)
                                .frame(width: 54, height: 54)
                                .overlay {
                                    Image("coachImage")
                                        .resizable()
                                        .frame(width: 42, height: 42)
                                        .cornerRadius(30)
                                }
                            Text("Name")
                                .font(.custom("Sombra-Black", size: 14))
                                .foregroundStyle(Color.theme.mainTextColor)
                            Text("Surname")
                                .font(.custom("Sombra-Black", size: 14))
                                .foregroundStyle(Color.theme.mainTextColor)
                        }
                    }
                }
               
            }
            .frame(height: 96)
            .padding(.horizontal)
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
                }
                Spacer(minLength: 90)
            }
        }
    }
}
