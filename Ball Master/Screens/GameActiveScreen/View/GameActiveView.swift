//
//  GameActiveView.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 04.06.2024.
//

import SwiftUI
import SwiftMessages
struct GameActiveView: View {
    @ObservedObject var viewModel: GameActiveViewModel
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
                    .padding(.top,DeviceType.IS_SMALL ?  3 : 10)
                gameProgress
                controlButtons
            }
        }
    }
}

#Preview {
    GameActiveView(viewModel: GameActiveViewModel(game: GameModel(teams: Teams(home: TeamModel(name: "Defending Champs", description: "1", color: "#EA7359"), away: TeamModel(name: "Air Jordans", description: "2", color: "#34E7DC")), score: ScoreInfo(home: Score(), away: Score()))))
}


extension GameActiveView {
    private var header: some View {
        HStack {
             Button {
                 viewModel.leaveFromScreen()
             } label: {
                 Image("backButton")
                     .frame(width: 52, height: 52)
             }
             .padding(.leading, 16)
             Spacer()
         }
    }
}

extension GameActiveView {
    private var teams: some View {
        VStack {
            HStack {
                VStack {
                    Circle()
                        .frame(width: DeviceType.IS_SMALL ?  44 : 62, height: DeviceType.IS_SMALL ?  44 : 62)
                        .foregroundStyle(Color(hex: viewModel.game.teams.home.color))
                        .overlay {
                            Text("\(getLetters(words: viewModel.game.teams.home.name))")
                                .font(.custom("Sombra-Medium", size: 13))
                                .foregroundStyle(Color.theme.buttonTextColor)
                        }
                    Text("\(viewModel.game.teams.home.name)")
                        .foregroundStyle(Color.theme.mainTextColor)
                        .font(.custom("Sombra-Medium", size: 17))
                        .multilineTextAlignment(.center)
                        .frame(width: 115)
                }
                Spacer()
                VStack {
                    Text("Live")
                        .font(.custom("Sombra-Medium", size: 15))
                        .foregroundStyle(Color.theme.buttonColor)
                    
                    RoundedRectangle(cornerRadius: 23)
                        .frame(width: 78, height: 36)
                        .foregroundStyle(Color(hex: "#2C2E32"))
                        .overlay {
                            Text("\(timeString(time: (viewModel.gameUpdate?.currentTime)!))")
                                .foregroundStyle(Color.theme.mainTextColor)
                                .font(.custom("Montserrat-Medium", size: 16))
                        }
                }
                Spacer()
                VStack {
                    Circle()
                        .frame(width: DeviceType.IS_SMALL ?  44 : 62, height: DeviceType.IS_SMALL ?  44 : 62)
                        .foregroundStyle(Color(hex: viewModel.game.teams.away.color))
                        .overlay {
                            Text("\(getLetters(words: viewModel.game.teams.away.name))")
                                .font(.custom("Sombra-Medium", size: 13))
                                .foregroundStyle(Color.theme.buttonTextColor)
                        }
                    Text("\(viewModel.game.teams.away.name)")
                        .foregroundStyle(Color.theme.mainTextColor)
                        .font(.custom("Sombra-Medium", size: 17))
                        .multilineTextAlignment(.center)
                        .frame(width: 115)
                }
            }
            .padding(.horizontal, 16)
            HStack {
                Text("\((viewModel.gameUpdate?.score.home.total)!)")
                    .font(.custom("Montserrat-Bold", size: 20))
                    .foregroundStyle(Color.theme.mainTextColor)
                Image("arrowLeft")
                    .opacity((viewModel.gameUpdate?.score.home.total)! > (viewModel.gameUpdate?.score.away.total)! ? 1 : 0)
                Spacer()
                Text("Points")
                    .foregroundStyle(Color.theme.deteilsTextColor)
                    .font(.custom("Montserrat-Medium", size: 14))
                Spacer()
                Image("arrowRight")
                    .opacity((viewModel.gameUpdate?.score.home.total)! < (viewModel.gameUpdate?.score.away.total)! ? 1 : 0)
                Text("\((viewModel.gameUpdate?.score.away.total)!)")
                    .font(.custom("Montserrat-Bold", size: 20))
                    .foregroundStyle(Color.theme.mainTextColor)
            }
            .padding(.horizontal, 60)
            .padding(.top, 8)
            
            HStack {
                Button {
                    withAnimation(.smooth) {
                        viewModel.isShowAlerRefresh.toggle()
                    }
                } label: {
                    HStack {
                        Image("refresh")
                        Text("Refresh")
                            .foregroundStyle(Color.theme.mainTextColor)
                            .font(.custom("Sombra-Medium", size: 17))
                    }
                    .frame(width: 175, height: 52)
                    .background(Color(hex: "#12171B"))
                    .cornerRadius(41)
                }
                .alert("Do you really want to refresh your game data?",isPresented: $viewModel.isShowAlerRefresh) {
                    Button("Cancel", role: .cancel) { }
                    Button() {
                        viewModel.refreshData()
                    } label: {
                        Text("Refresh")
                        
                    }
                }
                
                Button {
                    viewModel.saveGame()
                } label: {
                    HStack {
                        Image(viewModel.isSaved ? "saved":"save")
                        Text("Save")
                            .foregroundStyle(Color.theme.mainTextColor)
                            .font(.custom("Sombra-Medium", size: 17))
                    }
                    .frame(width: 175, height: 52)
                    .background(Color(hex: "#12171B"))
                    .cornerRadius(41)
                }
            }
            .padding(.top, DeviceType.IS_SMALL ?  5 : 20)
        }
    }
}


extension GameActiveView {
    private var gameProgress: some View {
        VStack {
            HStack {
               Text("Game Progress")
                    .foregroundStyle(Color.theme.mainTextColor)
                    .font(.custom("Sombra-Medium", size: 24))
                Spacer()
            }
            .padding(.top,DeviceType.IS_SMALL ?  0 : 24)
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
                        ForEach(viewModel.gameUpdate!.events, id: \.self) {
                            item in
                            EventCell(model: item)
                        }
                        .onDelete(perform: { indexSet in
                            viewModel.deleteEvent(at: indexSet)
                        })
                        .listRowSeparatorTint(Color.white.opacity(0.12))
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 3))
                        
                    }
                    .scrollContentBackground(.hidden)
                }
            
        }
    }
}

extension GameActiveView {
    private var controlButtons: some View {
        VStack {
            Button {
                withAnimation(.smooth) {
                    viewModel.isSheetShowed.toggle()
                }
            } label: {
                Text("Add Points")
                    .foregroundStyle(Color.theme.buttonTextColor)
                    .font(.custom("Sombra-Black", size: 15))
                    .frame(width: 358, height: 50)
                    .background(Color.theme.buttonColor)
                    .cornerRadius(30)
            }
            .padding(.top,DeviceType.IS_SMALL ?  10 : 30)
            .sheet(isPresented: $viewModel.isSheetShowed, content: {
                PointsSheet(isPresented: $viewModel.isSheetShowed)
                    .environmentObject(viewModel)
                    .presentationDetents([.height(308)])
            })
            Button {
                withAnimation(.smooth) {
                    viewModel.isShowAlert.toggle()
                }
            } label: {
                Text("Finish game")
                    .foregroundStyle(Color.theme.buttonColor)
                    .font(.custom("Sombra-Black", size: 15))
                    .frame(width: 358, height: 50)
                    .background(Color.clear)
                    .cornerRadius(30)
            }
            .roundedCornerWithBorder(lineWidth: 1, borderColor: Color.theme.buttonColor, radius: 30, corners: .allCorners)
            .alert("Do you really want to finish  game?",isPresented: $viewModel.isShowAlert) {
                Button("Cancel", role: .cancel) { }
                Button(role: .destructive) {
                    viewModel.finishGame()
                    let message = DemoMessage(title: "Game Sucesful Saved!", body: "you back to main screen")
                    let messageView = MessageHostingView(id: message.id, content: DemoMessageView(message: message))
                    SwiftMessages.show(view: messageView)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.viewModel.backToMain()
                    }
                } label: {
                    Text("Finish")
                    
                }
            }
        }
    }
}
