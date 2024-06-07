//
//  DraggablePlayer.swift
//  Ball Master
//
//  Created by admin on 03.06.2024.
//

import SwiftUI

struct DraggablePlayer: View {
    @Binding var model: PlannerPlayer
    @Binding var isShowAlert: Bool
    @GestureState private var startLocation: CGPoint? = nil
    var body: some View {
        VStack {
            if model.type == .player {
                Circle()
                    .stroke(Color.theme.buttonColor, lineWidth: 1)
                    .frame(width: 54, height: 54)
                    .overlay {
                        Circle()
                            .foregroundColor(Color(hex: "#1F252A"))
                            .frame(width: 42, height: 42)
                            .overlay {
                                Text("\(model.number)")
                                    .font(.custom("Montserrat-Medium", size: 17))
                                    .foregroundColor(Color.white)
                            }
                    }
                Text("\(model.name)")
                    .font(.custom("Montserrat-Medium", size: 13))
                    .foregroundColor(Color.white)
                    .frame(width: 80, height: 26)
                    .background(Color.theme.deteilsTextColor)
                    .cornerRadius(9)
            } else {
                Circle()
                    .stroke(Color(hex:"#FF453A"), lineWidth: 1)
                    .frame(width: 54, height: 54)
                    .overlay {
                        Circle()
                            .foregroundColor(Color(hex: "#1F252A"))
                            .frame(width: 42, height: 42)
                            .overlay {
                                Text("X")
                                    .font(.custom("Montserrat-Medium", size: 17))
                                    .foregroundColor(Color(hex:"#FF453A"))
                            }
                    }
                Text("Opponent")
                    .font(.custom("Montserrat-Medium", size: 13))
                    .foregroundColor(Color.white)
                    .frame(width: 80, height: 26)
                    .background(Color.theme.deteilsTextColor)
                    .cornerRadius(9)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { action in
                    var newLocation = startLocation ?? model.position
                    newLocation.x += action.translation.width
                    newLocation.y += action.translation.height
                    model.position = newLocation
//                    let location = action.location
//                    let newWidth = location.x
//                    let newHeight = location.y
//                    let size = CGPoint(x: newWidth, y: newHeight)
//                    model.position = size
                }.updating($startLocation) { (value, startLocation, transaction) in
                    startLocation = startLocation ?? model.position
                }
//                .onEnded { action in
//                    let location = action.location
//                    let newWidth = location.x
//                    let newHeight = location.y
//                    let size = CGPoint(x: newWidth, y: newHeight)
//                    model.position = size
//                }
        )
        .onLongPressGesture(minimumDuration: 2) {
            isShowAlert = true
        }
        .position(model.position)
    }
}

#Preview {
    @State var player: PlannerPlayer = PlannerPlayer(name: "Kurochka", number: "44", type: .player, position: CGPoint(x: 100, y: 150))
   return  VStack {
        DraggablePlayer(model: $player, isShowAlert: .constant(false))
    }
   
//    struct PreviewWrapper: View {
//
//        var body: some View {
//            DraggablePlayer(model: $player, isShowAlert: .constant(false))
//        }
////        return PreviewWrapper()
//    }
}


func tapGesture() -> some Gesture {
    TapGesture()
        .onEnded { value in
        }
}
