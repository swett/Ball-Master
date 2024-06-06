//
//  PlannerDeteilView.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import SwiftUI

struct PlannerDeteilView: View {
    @ObservedObject var viewModel: PlannerDeteilViewModel
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                header
                plannerImage
                Spacer()
                text
            }
        }
    }
}

#Preview {
    PlannerDeteilView(viewModel: PlannerDeteilViewModel( planner: PlannerModel(name: "", description: "", planImage: "")))
}



extension PlannerDeteilView {
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


extension PlannerDeteilView {
    private var text: some View {
        VStack {
            HStack {
                Text("\(viewModel.model.name)")
                    .foregroundStyle(Color.theme.mainTextColor)
                    .font(.custom("Sombra-Black", size: 24))
                Spacer()
            }
            .padding(.horizontal, 16)
            ScrollView {
                Text("\(viewModel.model.description)")
                    .foregroundStyle(Color.theme.deteilsTextColor)
                    .font(.custom("Montserrat-Medium", size: 16))
            }
            .padding(.horizontal, 16)
            .frame(height: 147)
        }
    }
}

extension PlannerDeteilView {
    private var plannerImage: some View {
        VStack {
//            Image("\(viewModel.model.planImage)")
            if let uiImage = ImageSaver.shared.getImageFromDocumentsDirectory(fileName: viewModel.model.planImage) {
                       Image(uiImage: uiImage)
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                   } else {
                       Text("Image not found")
                           .foregroundColor(.red)
                   }
        }
    }
}
