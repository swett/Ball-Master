//
//  GameCell.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import SwiftUI

struct GameCell: View {
    var model: GameModel
    var body: some View {
        ZStack(alignment:.top) {
            VStack {
                Rectangle()
                    .frame(width: 70, height: 24)
                    .foregroundStyle(model.isRunning ? Color.theme.buttonColor : Color(hex: "#2C2E32"))
                    .roundedCornerWithBorder(lineWidth: 0, borderColor: .clear, radius: 8, corners: [.bottomLeft, .bottomRight])
                    .overlay {
                        Text(model.isRunning ? "Live" : "Finished")
                            .foregroundStyle(model.isRunning ? Color.theme.buttonTextColor : Color.theme.mainTextColor.opacity(0.5))
                            .font(.custom("Sombra-Medium", size: 14))
                    }
                HStack {
                    VStack {
                        Circle()
                            .foregroundStyle(Color(hex: "\(model.teams.home.color)"))
                            .frame(width: 44, height: 44)
                        Text("\(model.teams.home.name)")
                            .foregroundStyle(Color.theme.mainTextColor)
                            .font(.custom("Sombra-Medium", size: 14))
                            .multilineTextAlignment(.center)
                            .frame(width: 80)
                    }
                    .frame(height: 84)
                    Spacer()
                    VStack {
                        HStack {
                            Text("\(model.score.home.total)")
                                .font(.custom("Montserrat-Bold", size: 20))
                                .foregroundStyle(Color.theme.mainTextColor)
                            Image("arrowLeft")
                                .opacity(model.score.home.total > model.score.away.total ? 1 : 0)
                            Spacer()
                            Image("arrowRight")
                                .opacity(model.score.away.total > model.score.home.total ? 1 : 0)
                            Text("\(model.score.away.total)")
                                .font(.custom("Montserrat-Bold", size: 20))
                                .foregroundStyle(Color.theme.mainTextColor)
                        }
                        if model.isRunning {
                            Text("\(timeString(time: model.currentTime))")
                                .font(.custom("Montserrt-Medium", size: 13))
                                .foregroundStyle(Color.theme.mainTextColor)
                                .padding(.all, 10)
                                .background(Color(hex: "#2C2E32"))
                                .cornerRadius(28)
                        } else {
                            Text("\(model.dateCreation.getFormattedDate(format: "dd/MM/yyyy"))")
                                .font(.custom("Montserrt-Medium", size: 13))
                                .foregroundStyle(Color.theme.mainTextColor)
                                .padding(.all, 10)
                                .background(Color(hex: "#2C2E32"))
                                .cornerRadius(28)
                        }
                        
                    }
                    Spacer()
                    VStack {
                        Circle()
                            .foregroundStyle(Color(hex: "\(model.teams.away.color)"))
                            .frame(width: 44, height: 44)
                        Text("\(model.teams.away.name)")
                            .foregroundStyle(Color.theme.mainTextColor)
                            .font(.custom("Sombra-Medium", size: 14))
                            .multilineTextAlignment(.center)
                            .frame(width: 80)
                    }
                    .frame(height: 84)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 22)
            }
            
            
        }
        .frame(width: 358,height: 132)
        .background(Color(hex: "#12171B"))
        .cornerRadius(30)
    }
}

#Preview {
    GameCell(model: GameModel(teams: Teams(home: TeamModel(name: "Defending Champs", description: "1", color: "#EA7359"), away: TeamModel(name: "Air Jordans", description: "2", color: "#34E7DC")), score: ScoreInfo(home: Score(), away: Score()), isRunning: false))
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func roundedCornerWithBorder(lineWidth: CGFloat, borderColor: Color, radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
            .overlay(RoundedCorner(radius: radius, corners: corners)
                .stroke(borderColor, lineWidth: lineWidth))
    }
}
