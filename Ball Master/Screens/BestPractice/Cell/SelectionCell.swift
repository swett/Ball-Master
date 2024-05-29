//
//  SelectionCell.swift
//  Ball Master
//
//  Created by admin on 28.05.2024.
//

import SwiftUI

struct SelectionCell: View {
    var nameOfCategory: String
    @Binding var isSelected: Bool
    var body: some View {
        Text("\(nameOfCategory)")
            .font(.custom("Sombra-Medium", size: 14))
            .padding(.vertical, 18)
            .padding(.horizontal, 40)
            .foregroundColor(isSelected ? .white : .theme.deteilsTextColor)
            .background(isSelected ? Color(hex: "#23272B"): .clear)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}


#Preview {
   
    VStack {
        SelectionCell(nameOfCategory: "All", isSelected: .constant(false))
        SelectionCell(nameOfCategory: "Defense", isSelected: .constant(false))
        SelectionCell(nameOfCategory: "Attack", isSelected: .constant(false))
        SelectionCell(nameOfCategory: "Share", isSelected: .constant(false))
    }
        .background(.black)
}
