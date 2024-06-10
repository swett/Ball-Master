//
//  CoachCell.swift
//  Ball Master
//
//  Created by admin on 28.05.2024.
//

import SwiftUI

struct CoachCell: View {
    var model: CoachModel
    @State var isSaved: Bool = false
    var index: Int
    var saveCoach: (_ index: Int) -> Void
    var body: some View {
        HStack {
            Circle()
                .stroke(Color.theme.buttonColor,lineWidth: 1)
                .frame(width: 54, height: 54)
                .overlay {
                    Image("\(model.image)")
                        .resizable()
                        .frame(width: 42, height: 42)
                        .cornerRadius(30)
                        .overlay(alignment: .bottomLeading) {
                            ZStack {
                                ForEach(model.clubIcon.indices, id: \.self) {
                                    index in
                                    Image(model.clubIcon[index])
                                        .resizable()
                                        .frame(width: 19, height: 19)
                                        .padding(.leading, index == -1 ? 0 : CGFloat(22 * (index - 1)))
                                }
                                
                                
                            }
                            .offset(x: model.clubIcon.count == 1 ? 50 : 30, y:10)
                        }
                }
                .padding(.leading, 16)
            VStack(alignment: .leading) {
                Text(model.name)
                    .foregroundStyle(Color.theme.mainTextColor)
                    .font(.custom("Sombra-Medium", size: 15))
                Text(model.strategyName)
                    .foregroundStyle(Color.theme.deteilsTextColor)
                    .font(.custom("Sombra-Thin", size: 13))
                
            }
            .padding(.leading)
            Spacer()
            Button {
                withAnimation {
                    saveCoach(index)
                }
            } label: {
                Text("\(isSaved ? "Saved" : "Save")")
                    .foregroundStyle(isSaved ? Color.theme.mainTextColor : Color.theme.buttonTextColor)
                    .font(.custom("Sombra-Medium", size: 15))
                    .frame(width: 71, height: 28, alignment: .center)
                    .background(isSaved ?   Color(hex: "#242B31") : Color.theme.buttonColor)
                    .cornerRadius(28)
            }
            .padding(.trailing , 16)
        }
        .frame(height: 84)
        .background(Color(hex: "#12171B"))
        .cornerRadius(16)
        .padding(.horizontal, 16)
        
        .onAppear {
            isSaved = AppData.shared.savedCoaches.contains {$0.id == model.id}
        }
    }
}

#Preview {
    CoachCell(model: BasketballStrategies.strategies[0], index: 1, saveCoach: {index in})
        .background(Color.black)
        .ignoresSafeArea(.all)
}
