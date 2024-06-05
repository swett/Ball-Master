//
//  UserStatsView.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 05.06.2024.
//

import SwiftUI

struct UserStatsView: View {
    @ObservedObject var viewModel: UserStatsViewModel
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                header
                userInfo
                recomends
            }
        }
    }
}

#Preview {
    UserStatsView(viewModel: UserStatsViewModel())
}


extension UserStatsView {
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


extension UserStatsView {
    private var userInfo: some View {
        VStack {
            Image("profile")
                .resizable()
                .frame(width: DeviceType.IS_SMALL ? 40 : 80, height: DeviceType.IS_SMALL ? 40 : 80)
            Text("Dear User")
                .font(.custom("Sombra-Medium", size: 20))
                .foregroundStyle(Color.theme.mainTextColor)
            Text("id: \(viewModel.user.id.uuidString.prefix(4))")
                .foregroundStyle(Color.theme.deteilsTextColor)
                .font(.custom("Montserrat-Regular", size: 15))
            
            HStack {
                VStack {
                    Image("ball")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("\(viewModel.user.gamesCreated)")
                        .foregroundStyle(Color.theme.mainTextColor)
                        .font(.custom("Montserrat-Bold", size: 20))
                    Text("Games Created")
                        .font(.custom("Sombra-Thin", size: 14))
                        .foregroundStyle(Color.theme.mainTextColor.opacity(0.5))
                        .multilineTextAlignment(.center)
                        .frame(width: 81)
                }
                .frame(width: 175, height: 120)
                .background(Color.theme.buttonColor.opacity(0.1))
                .cornerRadius(30)
                VStack {
                    Image("planner")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("\(viewModel.user.gamesCreated)")
                        .foregroundStyle(Color.theme.mainTextColor)
                        .font(.custom("Montserrat-Bold", size: 20))
                    Text("Planners created")
                        .font(.custom("Sombra-Thin", size: 14))
                        .foregroundStyle(Color.theme.mainTextColor.opacity(0.5))
                        .multilineTextAlignment(.center)
                        .frame(width: 81)
                }
                .frame(width: 175, height: 120)
                .background(Color.theme.buttonColor.opacity(0.1))
                .cornerRadius(30)
            }
            
            HStack {
                VStack {
                    Image("time")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("\(viewModel.user.gamesCreated)")
                        .foregroundStyle(Color.theme.mainTextColor)
                        .font(.custom("Montserrat-Bold", size: 20))
                    Text("Longest Game")
                        .font(.custom("Sombra-Thin", size: 14))
                        .foregroundStyle(Color.theme.mainTextColor.opacity(0.5))
                        .multilineTextAlignment(.center)
                        .frame(width: 75)
                }
                .frame(width: 175, height: 120)
                .background(Color.theme.buttonColor.opacity(0.1))
                .cornerRadius(30)
                VStack {
                    Image("timer")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("\(viewModel.user.gamesCreated)")
                        .foregroundStyle(Color.theme.mainTextColor)
                        .font(.custom("Montserrat-Bold", size: 20))
                    Text("Shortest Game")
                        .font(.custom("Sombra-Thin", size: 14))
                        .foregroundStyle(Color.theme.mainTextColor.opacity(0.5))
                        .multilineTextAlignment(.center)
                        .frame(width: 81)
                }
                .frame(width: 175, height: 120)
                .background(Color.theme.buttonColor.opacity(0.1))
                .cornerRadius(30)
            }
        }
    }
}

extension UserStatsView {
    private var recomends: some View {
        VStack {
            HStack {
                Text("Reccomended to read")
                    .font(.custom("Sombra-Medium", size: 24))
                    .foregroundStyle(Color.theme.mainTextColor)
                Spacer()
                Button {
                    
                } label: {
                    Text("See all")
                        .font(.custom("Sombra-Thin", size: 16))
                        .foregroundStyle(Color.theme.mainTextColor.opacity(0.5))
                }
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
