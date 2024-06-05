//
//  BestPractiveView.swift
//  Ball Master
//
//  Created by admin on 28.05.2024.
//

import SwiftUI

struct BestPracticeView: View {
    @ObservedObject var viewModel: BestPracticeViewModel
    var body: some View {
        ZStack(alignment: .top){
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            VStack{
                header
                selectionCell
                    .padding(.top, 10)
                main
                    .padding(.top, 10)
            }
        }
    }
}

#Preview {
    BestPracticeView(viewModel: BestPracticeViewModel())
}

extension BestPracticeView {
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

extension BestPracticeView {
    private var selectionCell: some View {
        VStack {
            HStack{
                Text("Best Practice")
                    .font(.custom("Sombra-Medium", size: 28))
                    .foregroundStyle(Color.theme.mainTextColor)
                Spacer()
            }
            .padding(.horizontal, 16)
            HStack{
                Text("Choose what type of practice you need.")
                    .font(.custom("Sombra-Thin", size: 15))
                    .foregroundStyle(Color.theme.deteilsTextColor)
                Spacer()
            }
            .padding(.horizontal, 16)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(Array(PracticeType.allCases.enumerated()), id: \.offset) { (index, item) in
                        SelectionCell(
                            nameOfCategory: item.rawValue,
                            isSelected: Binding<Bool>(
                                get: { index == viewModel.selectedIndex },
                                set: { _ in viewModel.selectedIndex = index }
                            )
                        )
                        .onTapGesture {
                            withAnimation {
                                self.viewModel.selectedIndex = index
                                self.viewModel.sortStrategy()
                            }
                            
                        }
                    }
                }
            }
            .padding(.top, 10)
            .padding(.leading, 16)
            .frame(height: 52)
        }
    }
}

extension BestPracticeView {
    private var main: some View {
        VStack {
            HStack {
                Text("All Practice")
                    .font(.custom("Sombra-Medium", size: 24))
                    .foregroundStyle(Color.theme.mainTextColor)
                Spacer()
            }
            .padding(.horizontal, 16)
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.practiceArray, id: \.self) {
                    item in
                    PracticeCell(model: item)
                        .onTapGesture {
                            viewModel.showPracticeDeteil(model: item)
                        }
                }
                Spacer(minLength: 60)
            }
        }
    }
}
