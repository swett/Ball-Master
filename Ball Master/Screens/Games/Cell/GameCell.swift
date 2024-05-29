//
//  GameCell.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import SwiftUI

struct GameCell: View {
    var body: some View {
        ZStack(alignment:.top) {

            VStack {
                Rectangle()
                    .frame(width: 70, height: 24)
                    .foregroundStyle(Color.theme.buttonColor)
                    .roundedCornerWithBorder(lineWidth: 0, borderColor: .clear, radius: 8, corners: [.bottomLeft, .bottomRight])
                    .overlay {
                        Text("Live")
                    }
                HStack {
                    VStack {
                        Circle()
                            .frame(width: 44, height: 44)
                        Text("Some Team Name")
                            .foregroundStyle(Color.theme.mainTextColor)
                            .font(.custom("Sombra-Medium", size: 14))
                            .multilineTextAlignment(.center)
                            .frame(width: 80)
                    }
                    Spacer()
                    VStack {
                        HStack {
                            Text("45")
                                .font(.custom("Montserrat-Bold", size: 20))
                                .foregroundStyle(Color.theme.mainTextColor)
                            Image("arrowLeft")
                            Spacer()
                            Image("arrowRight")
                            Text("46")
                                .font(.custom("Montserrat-Bold", size: 20))
                                .foregroundStyle(Color.theme.mainTextColor)
                        }
                        
                        Text("01 : 28 : 32")
                            .font(.custom("Montserrt-Medium", size: 13))
                            .foregroundStyle(Color.theme.mainTextColor)
                            .padding(.all, 10)
                            .background(Color(hex: "#2C2E32"))
                            .cornerRadius(28)
                    }
                    Spacer()
                    VStack {
                        Circle()
                            .frame(width: 44, height: 44)
                        Text("Some Team Name")
                            .foregroundStyle(Color.theme.mainTextColor)
                            .font(.custom("Sombra-Medium", size: 14))
                            .multilineTextAlignment(.center)
                            .frame(width: 80)
                    }
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
    GameCell()
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
