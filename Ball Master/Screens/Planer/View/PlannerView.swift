//
//  PlannerView.swift
//  Ball Master
//
//  Created by admin on 27.05.2024.
//

import SwiftUI

struct PlannerView: View {
    @ObservedObject var viewModel: PlannerViewModel
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                header
                if viewModel.plannerArrray.isEmpty {
                    emptyState
                        .padding(.top, 32)
                } else {
                    plannerState
                        .padding(.top, 32)
                }
            }
        }
        .onAppear {
            viewModel.getPlannersArray()
        }
    }
}

#Preview {
    PlannerView(viewModel: PlannerViewModel())
}


extension PlannerView {
    private var header: some View {
        VStack {
            HStack {
                VStack {
                    
                    Text("Planner")
                        .font(.custom("Sombra-Medium", size: 32))
                        .foregroundStyle(Color.theme.mainTextColor)
                }
                Spacer()
                Image("profile")
                    .resizable()
                    .frame(width: 44, height: 44)
            }
            .padding(.horizontal, 16)
            
            Button {
                viewModel.openPlanerCreation()
            } label: {
                HStack {
                    Image("plus")
                    Text("Add New Planner")
                        .foregroundStyle(Color.theme.buttonTextColor)
                        .font(.custom("Sombra-Black", size: 15))
                }
                .frame(width: 358, height: 50)
                .background(Color.theme.buttonColor)
                .cornerRadius(30)
            }
            .padding(.top, 15)
        }
        
    }
}


extension PlannerView {
    private var emptyState: some View {
        VStack {
            Text("You haven`t created any games yet, start right now!")
                .frame(width: 247)
                .font(.custom("Montserrat-Medium", size: 14))
                .foregroundStyle(Color.theme.mainTextColor).opacity(0.12)
                .multilineTextAlignment(.center)
        }
        .frame(width: 358, height: 64)
        .foregroundStyle(Color.clear)
        .roundedCornerWithBorder(lineWidth: 1, borderColor: .white.opacity(0.12), radius: 15, corners: [.allCorners])
        
        
    }
}


extension PlannerView {
    private var plannerState: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.plannerArrray, id: \.self) {
                    item in
                    PlannerCell(model: item)
                        .onTapGesture {
                            viewModel.openPlannerDeteil(model: item)
                            
                        }
                }
            }
        }
    }
}
