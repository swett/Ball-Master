//
//  PracticeCell.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import SwiftUI

struct PracticeCell: View {
    var model: PracticeModel
    var body: some View {
        ZStack {
            Image("\(model.image)")
                .resizable()
                .frame(height: 179)
                .cornerRadius(35)
            Color(hex: "#12171B").opacity(0.5)
                .cornerRadius(35)
            LinearGradient(colors: [Color(hex: "#12171B"),Color(hex: "#12171B").opacity(0)], startPoint: .leading, endPoint: .trailing)
                .cornerRadius(35)
            VStack {
                HStack {
                    Text("\(model.name)")
                        .foregroundStyle(Color.theme.mainTextColor)
                        .font(.custom("Sombra-Medium", size: 24))
                    Spacer()
                }
                .padding(.leading, 16)
                
                HStack {
                    Text("#\(model.type.rawValue.lowercased())")
                        .foregroundStyle(Color.theme.buttonColor)
                        .frame(width: 83, height: 33)
                        .background(Color.theme.buttonColor.opacity(0.1))
                        .cornerRadius(22)
                    Spacer()
                }
                .padding(.leading, 16)
                .padding(.top, 10)
            }
            
            
        }
        .frame(height: 179)
        .padding(.horizontal,16)
        
    }
}

#Preview {
    PracticeCell(model: PracticeModel(name: "Arm and abdominal strengthening", image: "best3", type: .defence, content: ""))
}
