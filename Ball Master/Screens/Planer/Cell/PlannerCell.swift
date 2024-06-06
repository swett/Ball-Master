//
//  PlannerCell.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 06.06.2024.
//

import SwiftUI

struct PlannerCell: View {
    var model: PlannerModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(model.name)")
                    .font(.custom("Sombra-Bold", size: 17))
                    .foregroundStyle(Color.theme.mainTextColor)
                Text("Created \(model.dateCreation.getFormattedDate(format: "dd.MM.yyyy"))")
                    .font(.custom("Sombra-Thin", size: 17))
                    .foregroundStyle(Color.theme.deteilsTextColor)
            }
            .padding(.leading, 16)
            Spacer()
            if let uiImage = ImageSaver.shared.getImageFromDocumentsDirectory(fileName: model.planImage) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                    .padding(.trailing, 16)
            } else {
                Text("Image not found")
                    .foregroundColor(.red)
                    .padding(.trailing, 16)
            }
        }
        .frame(width: 358,height: 132)
        .background(Color(hex: "#12171B"))
        .cornerRadius(30)
    }
}

#Preview {
    PlannerCell(model: PlannerModel(name: "Name", description: "Description", planImage: ""))
}
