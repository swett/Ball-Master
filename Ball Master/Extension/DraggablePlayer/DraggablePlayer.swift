//
//  DraggablePlayer.swift
//  Ball Master
//
//  Created by admin on 03.06.2024.
//

import SwiftUI

struct DraggablePlayer: View {
    var model: PlannerPlayer
    @Binding var isShowAlert: Bool
    @State var dragAmount: CGPoint = CGPoint.init(x: 100, y: 150)
    var body: some View {
        VStack {
            if model.type == .player {
                Circle()
                    .stroke(Color.theme.buttonColor,lineWidth: 1)
                    .frame(width: 54, height: 54)
                    .overlay {
                        Circle()
                            .foregroundStyle(Color(hex: "#1F252A"))
                            .frame(width: 42, height: 42)
                            .overlay {
                                Text("\(model.number)")
                                    .font(.custom("Montserrat-Medium", size: 17))
                                    .foregroundStyle(Color.theme.mainTextColor)
                                
                            }
                    }
                Text("\(model.name)")
                    .font(.custom("Montserrat-Medium", size: 13))
                    .foregroundStyle(Color.theme.mainTextColor)
                    .frame(width: 80, height: 26)
                    .background(Color(hex: "#545C62"))
                    .cornerRadius(9)
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
            }
        }
        .gesture(
            DragGesture(coordinateSpace: .global).onChanged {action in
                let location = action.location
                let newWidth = location.x
                let newHeight = location.y
                let size = CGPoint(x: newWidth, y: newHeight)
                self.dragAmount = size
            }.onEnded{action in
                let location = action.location
                let newWidth = location.x
                let newHeight = location.y
                let size = CGPoint(x: newWidth, y: newHeight)
                self.dragAmount = size
            }
        )
        .onLongPressGesture(minimumDuration: 2) {
            isShowAlert = true
        } 
        .position(x: dragAmount.x, y: dragAmount.y)
    }
}

#Preview {
    DraggablePlayer(model: PlannerPlayer(name: "Kurochka", number: "44", type: .opponent), isShowAlert: .constant(false))
}


func tapGesture() -> some Gesture {
    TapGesture()
        .onEnded { value in
        }
}
