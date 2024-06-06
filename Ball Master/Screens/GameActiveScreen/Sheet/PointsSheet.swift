//
//  PointsSheet.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 05.06.2024.
//

import SwiftUI

struct PointsSheet: View {
    @EnvironmentObject var viewModel: GameActiveViewModel
    @Binding var isPresented: Bool
    @State var selectedNumber: Int = 0
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                HStack {
                    Button {
                        withAnimation(.smooth) {
                            viewModel.isSheetShowed.toggle()
                        }
                    } label: {
                        Text("Close")
                            .font(.custom("Sombra-Medium", size: 17))
                            .foregroundStyle(Color(hex: "#FF453A"))
                    }
                    .padding(.leading, 16)
                    Spacer()
                    Button {
                        
                        if viewModel.selectedTeam == 1 {
                            viewModel.addEvent(event: Events(time: Int((viewModel.gameUpdate?.currentTime)!), team: viewModel.game.teams.home, score: selectedNumber))
                        } else {
                            viewModel.addEvent(event: Events(time: Int((viewModel.gameUpdate?.currentTime)!), team: viewModel.game.teams.away, score: selectedNumber))
                        }
                        
                        withAnimation(.smooth) {
                            viewModel.isSheetShowed.toggle()
                        }
                    } label: {
                        Text("Done")
                            .font(.custom("Sombra-Medium", size: 17))
                            .foregroundStyle(Color.theme.buttonColor)
                    }
                    .padding(.trailing, 16)
                }
                .padding(.top, 30)
                .padding(.bottom, 10)
                
                HStack {
                    Button {
                        withAnimation(.smooth) {
                            viewModel.selectedTeam = 1
                        }
                    } label: {
                        Text("\(viewModel.game.teams.home.name)")
                            .font(.custom("Sombra-Medium", size: 17))
                            .foregroundStyle(Color.theme.mainTextColor)
                            .padding(.vertical, 3)
                            .frame(width: 173)
                            .background(viewModel.selectedTeam == 1 ? Color(hex: "#545C62") : .clear)
                            .cornerRadius(7)
                            .padding(.leading, 3)
                    }
                    Button {
                        withAnimation(.smooth) {
                            viewModel.selectedTeam = 2
                        }
                    } label: {
                        Text("\(viewModel.game.teams.away.name)")
                            .font(.custom("Sombra-Medium", size: 17))
                            .foregroundStyle(Color.theme.mainTextColor)
                            .padding(.vertical, 3)
                            .frame(width: 173)
                            .background(viewModel.selectedTeam == 2 ? Color(hex: "#545C62") : .clear)
                            .cornerRadius(7)
                            .padding(.trailing, 3)
                    }
                }
                .frame(width: 358, height: 28)
                .background(Color(hex: "#767680").opacity(0.24))
                .cornerRadius(7)
                
                Picker("", selection: $selectedNumber) {
                    ForEach(1...30, id: \.self) { index in
                        Text("\(index)  Points")
                            .tag(index)
                            .foregroundColor(.theme.mainTextColor)
                    }
                }
                .pickerStyle(.wheel)
            }
          
        }
    }
}

#Preview {
    PointsSheet(isPresented: .constant(false))
        .environmentObject(GameActiveViewModel(game: GameModel(teams: Teams(home: TeamModel(name: "Defending Champs", description: "1", color: "#EA7359"), away: TeamModel(name: "Air Jordans", description: "2", color: "#34E7DC")), score: ScoreInfo(home: Score(), away: Score()))))
}
