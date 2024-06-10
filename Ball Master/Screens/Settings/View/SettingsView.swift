//
//  SettingsView.swift
//  Ball Master
//
//  Created by admin on 24.05.2024.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            
            VStack {
                user
                list
            }
            
        }
    }
}

#Preview {
    SettingsView(viewModel: SettingsViewModel())
}



extension SettingsView {
    private var user: some View {
        VStack {
            Image("profile")
                .resizable()
                .frame(width: DeviceType.IS_SMALL ? 40 : 80, height: DeviceType.IS_SMALL ? 40 : 80)
            Text("Dear User")
                .font(.custom("Sombra-Medium", size: 20))
                .foregroundStyle(Color.theme.mainTextColor)
            Text("id: \(AppData.shared.userStat.id.uuidString.prefix(4))")
                .foregroundStyle(Color.theme.deteilsTextColor)
                .font(.custom("Montserrat-Regular", size: 15))
            Button {
                withAnimation(.smooth) {
                    viewModel.showStats()
                }
            } label: {
                Text("See Statistic")
                    .font(.custom("Sombra-Medium", size: 14))
                    .foregroundStyle(Color.theme.buttonTextColor)
                    .frame(width: 121, height: 36, alignment: .center)
                    .background(Color.theme.buttonColor)
                    .cornerRadius(28)
            }
        }
        .padding(.top, DeviceType.IS_SMALL ? 25 : 0 )
    }
}

extension SettingsView {
    private var list: some View {
        VStack {
            HStack {
                Text("Settings")
                    .font(.custom("Sombra-Medium", size: 20))
                    .foregroundStyle(Color.theme.mainTextColor)
                Spacer()
            }
            .padding(.horizontal, 16)
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(Color(hex: "#12171B"))
                .frame(width: 358, height: 496)
                .padding(.bottom, 49)
                .overlay {
                    List {
                        ForEach(viewModel.settings, id: \.self) {
                            item in
                            Section {
                                ForEach(item.options, id: \.self) {
                                    item in
                                    switch item {
                                    case .staticCell(let model):
                                        StaticCellView(option: model){
                                            viewModel.openScreenByTittle(title: model.title)
                                        }
                                    case .switchCell(let model):
                                        SwitchCellView(option: model)
                                    }
                                }
                                Spacer(minLength: 90)
                            } header: {
                                Text("")
                                    .frame(height: 0)
                            }
                        }
                        .listRowSeparatorTint(Color.clear)
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 3))
                    }
                    .environment(\.defaultMinListHeaderHeight, 5)
                    .scrollContentBackground(.hidden)
                }
    
        }
    }
}




struct StaticCellView: View {
    let option: SettingsOption
    var onTap: () -> Void
    var body: some View {
        HStack {
            Image("\(getImageBySettingsName(name: "\(option.title)"))")
                .frame(width: 44, height: 44)
            Text(option.title)
                .foregroundColor(Color.theme.mainTextColor)
                .font(.custom("Sombra-Medium", size: 17))
            Spacer()
            Image("\(option.picture)")
        }
        .frame(height: 44)
        .onTapGesture {
            onTap() // Call the closure when tapped
        }
    }
}

struct SwitchCellView: View {
    @State private var isOn: Bool
    let option: SettingsSwitchOption
    
    init(option: SettingsSwitchOption) {
        _isOn = State(initialValue: option.isOn)
        self.option = option
    }
    
    var body: some View {
        HStack {
            Image("\(getImageBySettingsName(name: "\(option.title)"))")
                .frame(width: 44, height: 44)
            Toggle(option.title, isOn: $isOn)
                .foregroundColor(Color.theme.mainTextColor)
                .toggleStyle(ColoredToggleStyle(onColor: Color.theme.buttonColor, offColor: Color.theme.buttonColor.opacity(0.2)))
               
                .onChange(of: isOn) { newValue in
                    if option.title == "Vibration" {
                        AppData.shared.isVibration = !AppData.shared.isVibration
                    } else {
                        AppData.shared.isNotifications = !AppData.shared.isNotifications
                    }
                }
        }
        .frame(height: 44)
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct ColoredToggleStyle: ToggleStyle {
    var onColor = Color(UIColor.green)
    var offColor = Color(UIColor.systemGray5)
    var thumbColor = Color.white
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
            // The text (or view) portion of the Toggle
            Spacer()
            RoundedRectangle(cornerRadius: 16, style: .circular)
                .fill(configuration.isOn ? onColor : offColor)
                .frame(width: 50, height: 29)
                .overlay(
                    Circle()
                        .fill(thumbColor)
                        .shadow(radius: 1, x: 0, y: 1)
                        .padding(1.5)
                        .offset(x: configuration.isOn ? 10 : -10))
                .animation(Animation.easeInOut(duration: 0.2))
                .onTapGesture { configuration.isOn.toggle() }
        }
        .font(.custom("Sombra-Medium", size: 17))
    }
}
