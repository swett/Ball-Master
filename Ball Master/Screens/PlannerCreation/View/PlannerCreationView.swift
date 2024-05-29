//
//  PlannerCreationView.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import SwiftUI
import SwiftMessages
struct PlannerCreationView: View {
    @ObservedObject var viewModel: PlannerCreationViewModel
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                header
                
                if viewModel.isTextViewHidden {
                    
                } else {
                    main
                }
            }
        }
    }
}

#Preview {
    PlannerCreationView(viewModel: PlannerCreationViewModel())
}


extension PlannerCreationView {
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

extension PlannerCreationView {
    private var main: some View {
        VStack {
            HStack {
                Divider()
                    .frame(width: 4, height: 28)
                    .background(Color.theme.buttonColor)
                    .cornerRadius(10)
                Text("Planner Creation")
                    .font(.custom("Sombra-Medium", size: 24))
                    .foregroundStyle(Color.theme.mainTextColor)
                Spacer()
            }
            .padding(.horizontal, 16)
            HStack {
                Text("Enter Planner Name")
                    .foregroundColor(.theme.mainTextColor)
                    .font(.custom("Sombra-Medium", size: 17))
                    .padding(.leading, 16)
                Spacer()
            }
            .padding(.top)
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(hex: "#12171B"))
                .padding(.horizontal, 16)
                .frame(height: 44)
                .overlay {
                    TextField("Enter the name for your set", text: $viewModel.plannerName)
                        .foregroundColor(.theme.mainTextColor)
                        .font(.custom("Montserrat-Regular", size: 17))
                        .padding(.horizontal, 30)
                        .padding(.vertical, 11)
                        .onChange(of: viewModel.plannerName) { newValue in
                            let result = viewModel.textValidator(text: newValue)
                            viewModel.isPlannerNameInputed = result
                            viewModel.checkIsAllInputed()
                        }
                        .clearButton(text: $viewModel.plannerName)
                }
            HStack {
                Text("Enter Planner Description")
                    .foregroundColor(.theme.mainTextColor)
                    .font(.custom("Sombra-Medium", size: 17))
                    .padding(.leading, 16)
                Text("(Optional)")
                    .foregroundColor(.theme.deteilsTextColor)
                    .font(.custom("Montserrat-Medium", size: 13))
                Spacer()
            }
            .padding(.top)
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(hex: "#12171B"))
                .padding(.horizontal, 16)
                .frame(height: 128)
                .overlay(alignment: .top) {
                    TextField("Enter the name for your set", text: $viewModel.plannerDescription)
                        .foregroundColor(.theme.mainTextColor)
                        .font(.custom("Montserrat-Regular", size: 17))
                        .padding(.horizontal, 30)
                        .padding(.vertical, 11)
                        .clearButton(text: $viewModel.plannerDescription)
                }
            Spacer()
            Button {
                withAnimation(.smooth) {
                    viewModel.isTextViewHidden.toggle()
                }
                
            } label: {
                Text("Next")
                    .foregroundStyle(Color.theme.buttonTextColor)
                    .font(.custom("Sombra-Black", size: 15))
                    .frame(width: 358, height: 50)
                    .background(Color.theme.buttonColor)
                    .cornerRadius(30)
            }
            .opacity(!viewModel.isAllInputed ? 0.5 : 1)
            .disabled(!viewModel.isAllInputed)
        }
    }
}



struct ClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image("clearButton")
                }
                .padding(.trailing, 28)
            }
        }
    }
}

extension View {
    func clearButton(text: Binding<String>) -> some View {
        modifier(ClearButton(text: text))
    }
}

extension PlannerCreationView {
    private var plannerSection: some View {
        VStack {
            
        }
    }
}

