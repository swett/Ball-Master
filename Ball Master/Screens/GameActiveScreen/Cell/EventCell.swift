//
//  EventCell.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 05.06.2024.
//

import SwiftUI

struct EventCell: View {
    var model: Events
    var body: some View {
        HStack {
            Circle()
                .frame(width: 62, height: 62)
                .foregroundStyle(Color(hex: model.team.color))
                .overlay {
                    Text("\(getLetters(words: model.team.name))")
                        .font(.custom("Sombra-Medium", size: 13))
                        .foregroundStyle(Color.theme.buttonTextColor)
                }
            
            Text("+ \(model.score)")
                .font(.custom("Montserrat-Bold", size: 17))
                .foregroundStyle(Color.theme.mainTextColor)
            Spacer()
            RoundedRectangle(cornerRadius: 23)
                .frame(width: 42, height: 35)
                .foregroundStyle(Color(hex: "#2C2E32"))
                .overlay {
                    Text("  \(model.time)`")
                        .font(.custom("Montserrat-Medium", size: 12))
                        .foregroundStyle(Color.theme.mainTextColor)
                }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    EventCell(model: Events(time: 10, team: TeamModel(name: "Defending Champs", description: "1", color: "#EA7359"), score: 5))
}
