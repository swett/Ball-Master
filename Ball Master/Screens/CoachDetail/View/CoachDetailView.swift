//
//  CoachDeteilView.swift
//  Ball Master
//
//  Created by admin on 28.05.2024.
//

import SwiftUI

struct CoachDetailView: View {
    @ObservedObject var viewModel: CoachDetailViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            Rectangle()
                .foregroundStyle(Color(hex: "#12171B"))
                .frame(height: 290)
                .ignoresSafeArea(.all)
            VStack {
                header
                coach
                deteil
                    .padding(.top, 30)
                
            }
        }
    }
}

#Preview {
    CoachDetailView(viewModel: CoachDetailViewModel(model: CoachModel(image: "coachImage", clubIcon: ["team1","team1"], name: "Davis Lipshutz", content: coachTextStrategy, strategyName: "", strategyDescription: "Explore Coach Strategy")))
}


extension CoachDetailView {
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

extension CoachDetailView {
    private var coach: some View {
        HStack(alignment: .top) {
            Spacer()
            VStack {
                Circle()
                    .stroke(Color.theme.buttonColor,lineWidth: 1)
                    .frame(width: 82, height: 82)
                    .overlay {
                        Image("\(viewModel.model.image)")
                            .resizable()
                            .frame(width: 58, height: 58)
                            .cornerRadius(30)
                    }
                Text("\(viewModel.model.name)")
                    .foregroundStyle(Color.theme.mainTextColor)
                    .font(.custom("Sombra-Medium", size: 18))
                    .padding(.top, 10)
                Button {
                    withAnimation {
                        viewModel.saveCoach()
                    }
                } label: {
                    Text("\(viewModel.isSaved ? "Saved" : "Save")")
                        .foregroundStyle(viewModel.isSaved ? Color.theme.mainTextColor : Color.theme.buttonTextColor)
                        .font(.custom("Sombra-Medium", size: 15))
                        .frame(width: 124, height: 28, alignment: .center)
                        .background(viewModel.isSaved ?   Color(hex: "#242B31") : Color.theme.buttonColor)
                        .cornerRadius(28)
                }
                .padding(.top, 10)
            }
            .padding(.leading, 46)
            Spacer()
            HStack {
                ZStack {
                    ForEach(viewModel.model.clubIcon.indices, id: \.self) {
                        index in
                        Image(viewModel.model.clubIcon[index])
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.leading, index == -1 ? 0 : CGFloat(24 * (index - 1)))
                    }
                    
                    
                }
                .padding(.trailing, 16)
            }
           
        }
    }
}


extension CoachDetailView {
    private var deteil: some View {
        VStack {
            HStack {
                Text("Detail")
                    .foregroundStyle(Color.theme.mainTextColor)
                    .font(.custom("Sombra-Medium", size: 24))
                Spacer()
            }
            .padding(.horizontal, 16)
            ScrollView(.vertical, showsIndicators: false) {
                Text("\(viewModel.model.content)")
                    .foregroundStyle(Color.theme.deteilsTextColor)
                    .font(.custom("Montserrar-Medium", size: 16))
            }
            .padding(.horizontal, 16)
        }
    }
}
