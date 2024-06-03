//
//  TipView.swift
//  Ball Master
//
//  Created by admin on 30.05.2024.
//

import SwiftUI

struct TipView: View {
    @Binding var hideTip: Bool
    var body: some View {
        HStack(alignment: .top) {
            Image("tipImage")
                .padding(.leading, 16)
//            Spacer()
            VStack(alignment: .leading) {
                Text("Tip: Use easily")
                    .foregroundStyle(Color.theme.mainTextColor)
                    .font(.custom("Sombra-Bold", size: 17))
                HStack(spacing: 0) {
                    Text("•")
                    Text("Hold to drag player")
                }
                    .foregroundStyle(Color.theme.mainTextColor)
                    .font(.custom("Sombra-Thin", size: 15))
                    .padding(.top, 8)
                HStack (alignment: .top,spacing: 0){
                    Text("•")
                    Text("Tap on a player to change information")
                }
                    .foregroundStyle(Color.theme.mainTextColor)
                    .font(.custom("Sombra-Thin", size: 15))
            }
            .frame(width: 160)
            Spacer()
            Button {
                withAnimation(.smooth) {
                    hideTip.toggle()
                }
            } label: {
                Image("closeButton")
            }
            .padding(.trailing, 16)
        }
        .frame(width: 358, height: 117)
        .background(Color(hex: "#2A2E32"))
        .cornerRadius(30)
    }
}

#Preview {
    TipView(hideTip: .constant(false))
}
