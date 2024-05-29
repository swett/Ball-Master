//
//  TabViewBottom.swift
//  Ball Master
//
//  Created by admin on 24.05.2024.
//

import SwiftUI

struct TabViewBottom: View {
    @ObservedObject var viewModel: TabViewModel
    var body: some View {
        ZStack(alignment: .bottom) {
                    TabView(selection: $viewModel.selectedTab) {
                        GamesView(viewModel: viewModel.gamesViewModel!)
                            .tag(Tab.games)
                        CoachView(viewModel: viewModel.coachViewModel!)
                            .tag(Tab.coach)
                        PlannerView(viewModel: viewModel.plannerViewModel!)
                            .tag(Tab.planner)
                        SettingsView(viewModel: viewModel.settingsViewModel!)
                            .tag(Tab.settings)
                    }
                    .background(.clear)
                    
                    ZStack{
                        HStack{
                            ForEach(Tab.allCases){
                                item in
                                Button {
                                    viewModel.previousTab =  viewModel.selectedTab
                                    viewModel.selectedTab = item
                                } label: {
                                    CustomTabItem(imageName: item.iconName, tag: item.rawValue, isActive: ( viewModel.selectedTab.rawValue == item.rawValue))
                                }
                            }
                        }
                        
                    }
                    .frame(height: 76)
                    .padding(.bottom, 12)
                    
                    
                }
                .ignoresSafeArea(.all)
                .onAppear {
                    UITabBar.appearance().isHidden = true
                    viewModel.updateModels()
                }
    }
}

#Preview {
    TabViewBottom(viewModel: TabViewModel())
}


extension TabViewBottom {
    func CustomTabItem(imageName: String, tag: Int, isActive: Bool) -> some View{
        HStack{
            Spacer()
            Image(getImageWhenActive(tag: tag, isActive: isActive))
                .resizable()
                .frame(width: 49, height: 42)
            Spacer()
        }
        .frame(width: 64, height: 64)
        .background(Color.clear)
        .cornerRadius(14)
        .padding(.horizontal, 12)
    }
    
    
    func getImageWhenActive(tag: Int, isActive: Bool) -> String {
        
        switch tag {
        case 0: return "\(isActive ? "gamesActive": "gamesPassive")"
        case 1: return "\(isActive ? "coachActive": "coachPassive")"
        case 2: return "\(isActive ? "plannerActive": "plannerPassive")"
        case 3: return "\(isActive ? "settingsActive": "settingsPassive")"
        default: return ""
        }
    }
}
