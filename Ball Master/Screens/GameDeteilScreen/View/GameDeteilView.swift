//
//  GameDeteilView.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 05.06.2024.
//

import SwiftUI

struct GameDeteilView: View {
    @ObservedObject var viewModel: GameDeteilViewModel
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            Rectangle()
                .foregroundStyle(Color(hex: "#12171B"))
                .frame(height: DeviceType.IS_SMALL ?  200 : 290)
                .ignoresSafeArea(.all)
            VStack {
                header
                teams
                deteils
            }
        }
    }
}

#Preview {
    GameDeteilView(viewModel: GameDeteilViewModel(model: GameModel(teams: Teams(home: TeamModel(name: "Defending Champs", description: "Some team description bla bla. Image overflow background main figma edit horizontal. Star fill align connection polygon. Slice comment blur edit vector distribute community.", color: "#EA7359"), away: TeamModel(name: "Air Jordans", description: "Some team description bla bla. Image overflow background main figma edit horizontal. Star fill align connection polygon. Slice comment blur edit vector distribute community.", color: "#34E7DC")), score: ScoreInfo(home: Score(), away: Score()))))
}


extension GameDeteilView {
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

extension GameDeteilView {
    private var teams: some View {
        VStack {
            HStack {
                VStack {
                    Circle()
                        .frame(width: DeviceType.IS_SMALL ?  44 : 62, height: DeviceType.IS_SMALL ?  44 : 62)
                        .foregroundStyle(Color(hex: viewModel.model.teams.home.color))
                        .overlay {
                            Text("\(getLetters(words: viewModel.model.teams.home.name))")
                                .font(.custom("Sombra-Medium", size: 13))
                                .foregroundStyle(Color.theme.buttonTextColor)
                        }
                    Text("\(viewModel.model.teams.home.name)")
                        .foregroundStyle(Color.theme.mainTextColor)
                        .font(.custom("Sombra-Medium", size: 17))
                        .multilineTextAlignment(.center)
                        .frame(width: 115)
                }
                Spacer()
                VStack {
                    Circle()
                        .frame(width: DeviceType.IS_SMALL ?  44 : 62, height: DeviceType.IS_SMALL ?  44 : 62)
                        .foregroundStyle(Color(hex: viewModel.model.teams.away.color))
                        .overlay {
                            Text("\(getLetters(words: viewModel.model.teams.away.name))")
                                .font(.custom("Sombra-Medium", size: 13))
                                .foregroundStyle(Color.theme.buttonTextColor)
                        }
                    Text("\(viewModel.model.teams.away.name)")
                        .foregroundStyle(Color.theme.mainTextColor)
                        .font(.custom("Sombra-Medium", size: 17))
                        .multilineTextAlignment(.center)
                        .frame(width: 115)
                }
            }
            .padding(.horizontal, 16)
            HStack {
                Text("\(viewModel.model.score.home.total)")
                    .font(.custom("Montserrat-Bold", size: 20))
                    .foregroundStyle(Color.theme.mainTextColor)
                Image("arrowLeft")
                    .opacity((viewModel.model.score.home.total) > (viewModel.model.score.away.total) ? 1 : 0)
                Spacer()
                Text("Points")
                    .foregroundStyle(Color.theme.deteilsTextColor)
                    .font(.custom("Montserrat-Medium", size: 14))
                Spacer()
                Image("arrowRight")
                    .opacity(viewModel.model.score.home.total < viewModel.model.score.away.total ? 1 : 0)
                Text("\(viewModel.model.score.away.total)")
                    .font(.custom("Montserrat-Bold", size: 20))
                    .foregroundStyle(Color.theme.mainTextColor)
            }
            .padding(.horizontal, 60)
            .padding(.top, 0)
        }
        
    }
}


extension GameDeteilView {
    private var deteils: some View {
        ScrollView {
            HStack {
                Text("Game Progress")
                    .foregroundStyle(Color.theme.mainTextColor)
                    .font(.custom("Sombra-Medium", size: 24))
                Spacer()
            }
            .padding(.top,DeviceType.IS_SMALL ?  10 : 24)
            .padding(.horizontal, 16)
            HStack {
                Text("The points you added will be displayed here")
                    .foregroundStyle(Color.theme.deteilsTextColor)
                    .font(.custom("Sombra-Thin", size: 17))
                Spacer()
            }
            .padding(.horizontal, 16)
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(Color(hex: "#12171B"))
                .frame(width: 358, height: 220)
                .overlay {
                    List {
                        ForEach(viewModel.model.events, id: \.self) {
                            item in
                            EventCell(model: item)
                        }
                        .listRowSeparatorTint(Color.white.opacity(0.12))
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 3))
                    }
                    .scrollContentBackground(.hidden)
                }
            
            HStack {
                Text("Deteils")
                    .foregroundStyle(Color.theme.mainTextColor)
                    .font(.custom("Sombra-Medium", size: 24))
                Spacer()
            }
            .padding(.horizontal, 16)
            VStack {
                HStack {
                    Circle()
                        .frame(width: DeviceType.IS_SMALL ?  44 : 62, height: DeviceType.IS_SMALL ?  44 : 62)
                        .foregroundStyle(Color(hex: viewModel.model.teams.home.color))
                        .overlay {
                            Text("\(getLetters(words: viewModel.model.teams.home.name))")
                                .font(.custom("Sombra-Medium", size: 13))
                                .foregroundStyle(Color.theme.buttonTextColor)
                        }
                    
                    Text("\(viewModel.model.teams.home.name)")
                        .foregroundStyle(Color.theme.mainTextColor)
                        .font(.custom("Sombra-Medium", size: 17))
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                Text("\(viewModel.model.teams.home.description)")
                    .foregroundStyle(Color.theme.deteilsTextColor)
                    .font(.custom("Montserrat-Medium", size: 17))
            }
            .padding(.horizontal, 16)
            VStack {
                HStack {
                    Circle()
                        .frame(width: DeviceType.IS_SMALL ?  44 : 62, height: DeviceType.IS_SMALL ?  44 : 62)
                        .foregroundStyle(Color(hex: viewModel.model.teams.away.color))
                        .overlay {
                            Text("\(getLetters(words: viewModel.model.teams.away.name))")
                                .font(.custom("Sombra-Medium", size: 13))
                                .foregroundStyle(Color.theme.buttonTextColor)
                        }
                    
                    Text("\(viewModel.model.teams.away.name)")
                        .foregroundStyle(Color.theme.mainTextColor)
                        .font(.custom("Sombra-Medium", size: 17))
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                Text("\(viewModel.model.teams.away.description)")
                    .foregroundStyle(Color.theme.deteilsTextColor)
                    .font(.custom("Montserrat-Medium", size: 17))
            }
            .padding(.horizontal, 16)
            Spacer(minLength: 90)
        }
    }
}
