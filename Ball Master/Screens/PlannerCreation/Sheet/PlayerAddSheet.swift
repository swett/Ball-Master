//
//  PlayerAddSheet.swift
//  Ball Master
//
//  Created by admin on 03.06.2024.
//

import SwiftUI
import SwiftMessages
struct PlayerAddSheet: View {
    @Binding var isPresented: Bool
    @State var playerName: String = ""
    @State var playerNumber: String = ""
    @EnvironmentObject var viewModel: PlannerCreationViewModel
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
                        if viewModel.selectedState == .player {
                           checkValid()
                        } else {
                            viewModel.addPlayerToView(name: "", number: "", type: .opponent)
                            withAnimation(.smooth) {
                                viewModel.isSheetShowed.toggle()
                            }
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
                            viewModel.selectedState = .player
                        }
                    } label: {
                        Text("Player")
                            .font(.custom("Sombra-Medium", size: 17))
                            .foregroundStyle(Color.theme.mainTextColor)
                            .padding(.vertical, 3)
                            .frame(width: 173)
                            .background(viewModel.selectedState == .player ? Color(hex: "#545C62") : .clear)
                            .cornerRadius(7)
                            .padding(.leading, 3)
                    }
                    Button {
                        withAnimation(.smooth) {
                            viewModel.selectedState = .opponent
                        }
                    } label: {
                        Text("Opponent")
                            .font(.custom("Sombra-Medium", size: 17))
                            .foregroundStyle(Color.theme.mainTextColor)
                            .padding(.vertical, 3)
                            .frame(width: 173)
                            .background(viewModel.selectedState == .opponent ? Color(hex: "#545C62") : .clear)
                            .cornerRadius(7)
                            .padding(.trailing, 3)
                    }
                }
                .frame(width: 358, height: 28)
                .background(Color(hex: "#767680").opacity(0.24))
                .cornerRadius(7)
                
                if viewModel.selectedState == .player {
                    VStack {
                        Circle()
                            .stroke(Color.theme.buttonColor,lineWidth: 1)
                            .frame(width: 54, height: 54)
                            .overlay {
                                Circle()
                                    .foregroundStyle(Color(hex: "#1F252A"))
                                    .frame(width: 42, height: 42)
                                    .overlay {
                                        Text("\(playerNumber)")
                                            .font(.custom("Montserrat-Medium", size: 17))
                                            .foregroundStyle(Color.theme.mainTextColor)
                                            
                                    }
                            }
                        Text("\(playerName)")
                            .font(.custom("Montserrat-Medium", size: 13))
                            .foregroundStyle(Color.theme.mainTextColor)
                            .frame(width: 80, height: 26)
                            .background(Color(hex: "#545C62"))
                            .cornerRadius(9)
                        VStack {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(Color(hex: "#12171B"))
                                .padding(.horizontal, 16)
                                .frame(height: 44)
                                .overlay {
                                    TextField("Enter the name of player", text: $playerName)
                                        .foregroundColor(.theme.mainTextColor)
                                        .font(.custom("Montserrat-Regular", size: 17))
                                        .padding(.horizontal, 30)
                                        .padding(.vertical, 11)
                                        .onChange(of: playerName) { newValue in
                                            let result = viewModel.textValidator(text: newValue)
                                            viewModel.isPlayerNameInputed = result
                                        }
                                        .clearButton(text: $playerName)
                                }
                            Divider()
                                .padding(.horizontal, 16)
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(Color(hex: "#12171B"))
                                .padding(.horizontal, 16)
                                .frame(height: 44)
                                .overlay {
                                    TextField("Enter your score", text: $playerNumber)
                                        .foregroundColor(.theme.mainTextColor)
                                        .keyboardType(.numberPad)
                                        .font(.custom("Montserrat-Regular", size: 17))
                                        .padding(.horizontal, 30)
                                        .padding(.vertical, 11)
                                        .onChange(of: playerNumber) { newValue in
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if filtered != newValue {
                                                self.playerNumber = filtered
                                            }
                                            let result = viewModel.textValidatorNumber(text: newValue)
                                            viewModel.isPlayerNumberInputed = result
                                        }
                                        .clearButton(text: $playerNumber)
                                }
                        }
                        .background(Color(hex: "#12171B"))
                        .cornerRadius(20)
                        .padding(.horizontal, 16)
                        
                    }
                    .padding(.bottom, 40)
                } else {
                    Circle()
                        .stroke(Color(hex: "#FF453A"),lineWidth: 1)
                        .frame(width: 54, height: 54)
                        .overlay {
                            Circle()
                                .foregroundStyle(Color(hex: "#1F252A"))
                                .frame(width: 42, height: 42)
                                .overlay {
                                    Text("X")
                                        .font(.custom("Montserrat-Medium", size: 17))
                                        .foregroundStyle(Color(hex: "#FF453A"))
                                        
                                }
                        }
                    Text("Opponent")
                        .font(.custom("Montserrat-Medium", size: 13))
                        .foregroundStyle(Color.theme.mainTextColor)
                        .frame(width: 80, height: 26)
                        .background(Color(hex: "#545C62"))
                        .cornerRadius(9)
                    Spacer()
                }
            }
          
            
            
        }
        
    }
}

#Preview {
    PlayerAddSheet( isPresented: .constant(false))
        .environmentObject(PlannerCreationViewModel())
}


struct TextFieldNumber: View {
    @State private var number: Double?
    var body: some View {
        TextField("Placeholder", value: $number, format: .number)
    }
}


extension PlayerAddSheet {
    func checkValid() {
        var message = DemoMessage(title: "You not select any option!", body: "please select a all options")
        var messageView = MessageHostingView(id: message.id, content: DemoMessageView(message: message))
        
        if viewModel.isPlayerNameInputed && viewModel.isPlayerNumberInputed {
            viewModel.addPlayerToView(name: playerName, number: playerNumber, type: .player)
            withAnimation(.smooth) {
                viewModel.isSheetShowed.toggle()
            }
        } else {
            if !viewModel.isPlayerNameInputed {
                message = DemoMessage(title: "Name is too short please input", body: "input more then 3 characters")
                messageView = MessageHostingView(id: message.id, content: DemoMessageView(message: message))
            } else if (!viewModel.isPlayerNumberInputed) {
                message = DemoMessage(title: "number is too short please input", body: "input more then 1 characters")
                messageView = MessageHostingView(id: message.id, content: DemoMessageView(message: message))
            } else if (!viewModel.isPlayerNameInputed && !viewModel.isPlayerNumberInputed) {
                message = DemoMessage(title: "You not input any info!", body: "please input all info")
                messageView = MessageHostingView(id: message.id, content: DemoMessageView(message: message))
            }
          
            SwiftMessages.show(view: messageView)
        }
    }
}
