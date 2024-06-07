//
//  PlannerCreationView.swift
//  Ball Master
//
//  Created by admin on 29.05.2024.
//

import SwiftUI
import PencilKit
import SwiftMessages
struct PlannerCreationView: View {
    @Environment(\.undoManager) private var undoManager
    @ObservedObject var viewModel: PlannerCreationViewModel
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                header
                
                if viewModel.isTextViewHidden {
                    plannerSection
                } else {
                    main
                }
            }
        }
    }
    
}

#Preview {
    PlannerCreationView(viewModel: PlannerCreationViewModel())
}


extension PlannerCreationView {
    private var header: some View {
        HStack {
            if viewModel.isTextViewHidden {
                Button {
                    withAnimation(.smooth) {
                        viewModel.isShowCloseAlert.toggle()
                    }
                   
                } label: {
                    Text("Close")
                        .font(.custom("Sombra-Medium", size: 17))
                        .foregroundStyle(Color(hex: "#FF453A"))
                }
                .padding(.leading, 16)
                .alert("Do you really want to close?",isPresented: $viewModel.isShowCloseAlert) {
                    Button("No", role: .cancel) { }
                    Button {
                        viewModel.backToMain()
                    } label: {
                        Text("Yes")
                    }
                }
                Spacer()
                Text("\(viewModel.plannerName)")
                    .font(.custom("Sombra-Medium", size: 17))
                    .foregroundStyle(Color.theme.mainTextColor)
                Spacer()
                Button {
                    withAnimation(.smooth) {
                        viewModel.isShowSaveAlert.toggle()
                    }
                } label: {
                    Text("Save")
                        .font(.custom("Sombra-Medium", size: 17))
                        .foregroundStyle(Color.theme.buttonColor)
                }
                .padding(.trailing, 16)
                .alert("Do you really finish planning?",isPresented: $viewModel.isShowSaveAlert) {
                    Button("No", role: .cancel) { }
                    Button {
                        saveModel()
                    } label: {
                        Text("Yes")
                    }
                }
            } else {
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
        .padding(.bottom, 16)
        .background(viewModel.isTextViewHidden ? Color(hex: "#12171B"): .clear)
    }
}

extension PlannerCreationView {
    private var main: some View {
        VStack {
            HStack {
                Divider()
                    .frame(width: 4, height: 28)
                    .background(Color.theme.buttonColor)
                    .cornerRadius(10)
                Text("Planner Creation")
                    .font(.custom("Sombra-Medium", size: 24))
                    .foregroundStyle(Color.theme.mainTextColor)
                Spacer()
            }
            .padding(.horizontal, 16)
            HStack {
                Text("Enter Planner Name")
                    .foregroundColor(.theme.mainTextColor)
                    .font(.custom("Sombra-Medium", size: 17))
                    .padding(.leading, 16)
                Spacer()
            }
            .padding(.top)
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(hex: "#12171B"))
                .padding(.horizontal, 16)
                .frame(height: 44)
                .overlay {
                    TextField("Enter the name for your set", text: $viewModel.plannerName)
                        .foregroundColor(.theme.mainTextColor)
                        .font(.custom("Montserrat-Regular", size: 17))
                        .padding(.horizontal, 30)
                        .padding(.vertical, 11)
                        .onChange(of: viewModel.plannerName) { newValue in
                            let result = viewModel.textValidator(text: newValue)
                            viewModel.isPlannerNameInputed = result
                            viewModel.checkIsAllInputed()
                        }
                        .clearButton(text: $viewModel.plannerName)
                }
            HStack {
                Text("Enter Planner Description")
                    .foregroundColor(.theme.mainTextColor)
                    .font(.custom("Sombra-Medium", size: 17))
                    .padding(.leading, 16)
                Text("(Optional)")
                    .foregroundColor(.theme.deteilsTextColor)
                    .font(.custom("Montserrat-Medium", size: 13))
                Spacer()
            }
            .padding(.top)
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(hex: "#12171B"))
                .padding(.horizontal, 16)
                .frame(height: 128)
                .overlay(alignment: .top) {
                    TextField("Enter the name for your set", text: $viewModel.plannerDescription)
                        .foregroundColor(.theme.mainTextColor)
                        .font(.custom("Montserrat-Regular", size: 17))
                        .padding(.horizontal, 30)
                        .padding(.vertical, 11)
                        .clearButton(text: $viewModel.plannerDescription)
                }
            Spacer()
            Button {
                withAnimation(.smooth) {
                    viewModel.isTextViewHidden.toggle()
                }
                
            } label: {
                Text("Next")
                    .foregroundStyle(Color.theme.buttonTextColor)
                    .font(.custom("Sombra-Black", size: 15))
                    .frame(width: 358, height: 50)
                    .background(Color.theme.buttonColor)
                    .cornerRadius(30)
            }
            .opacity(!viewModel.isAllInputed ? 0.5 : 1)
            .disabled(!viewModel.isAllInputed)
        }
    }
}



struct ClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image("closeButton")
                }
                .padding(.trailing, 28)
            }
        }
    }
}

struct ClearButtonNumber: ViewModifier {
    @Binding var text: Double
    
    func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            
            if !text.isNaN {
                Button {
                    text = 0
                } label: {
                    Image("closeButton")
                }
                .padding(.trailing, 28)
            }
        }
    }
}

extension View {
    func clearButton(text: Binding<String>) -> some View {
        modifier(ClearButton(text: text))
    }
    func clearNumberButton(text: Binding<Double>) -> some View {
        modifier(ClearButtonNumber(text: text))
    }
}

extension PlannerCreationView {
    private var plannerSection: some View {
        VStack {
            Spacer(minLength: 30)
            drawingElement
            Spacer()
            HStack {
                Button {
                    print("undo")
                    undoManager?.undo()
                } label: {
                    Image("undoButton")
                }
                .padding(.leading, 16)
                
                Button {
                    undoManager?.redo()
                } label: {
                    Image("forwardButton")
                }
              
                Button {
                    withAnimation(.smooth) {
                        viewModel.isDrawing = false
                        viewModel.isEraser = true
                    }
                } label: {
                    Image(viewModel.isEraser ? "clearButtonOn" : "clearButton")
                }
                Spacer()
                Button {
                    withAnimation(.smooth) {
                        viewModel.isSheetShowed.toggle()
                    }
                    
                } label: {
                    Image("addPlayer")
                }
                .sheet(isPresented: $viewModel.isSheetShowed, content: {
                    PlayerAddSheet(isPresented: $viewModel.isSheetShowed)
                        .presentationDetents([.height(308)])
                        .environmentObject(viewModel)
                })
                Button {
                    withAnimation(.smooth) {
                        viewModel.isDrawing.toggle()
                        viewModel.isEraser = false
                    }
                } label: {
                    Image(viewModel.isDrawing ? "drawingOnButton" : "paintButton")
                }
                .padding(.trailing, 16)
            }
            .padding(.top, 16)
            .background(Color(hex: "#12171B"))
        }
    }
}


extension PlannerCreationView {
     private var drawingElement: some View {
        ZStack(alignment: .top) {
            Image("field")
//                .resizable()
//                .frame(width: 358, height: 605)
            
            DrawingView(canvas: $viewModel.canvas, isDrawing: $viewModel.isDrawing)
                
            ForEach($viewModel.playersArray, id: \.self) {
                $item in
                
                DraggablePlayer(model: $item, isShowAlert: $viewModel.isShowAlert)
                    .alert("Delete Player?",isPresented: $viewModel.isShowAlert) {
                        Button("Cancel", role: .cancel) { }
                        Button(role: .destructive) {
                            viewModel.deletePlayerFromField(player: item)
                        } label: {
                            Text("Delete")
                            
                        }
                    }
            }
            
            
            
            if !viewModel.isHideTip {
                TipView(hideTip: $viewModel.isHideTip)
            }
        }
        .frame(width: 358, height: 605)  // Ensure the view has a specific size
        .background(Color.clear)          // Ensure background is clear
        .ignoresSafeArea()
    }
}



extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        // Ensure the view is laid out correctly
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        // Debugging: Print target size and view bounds
        print("Target Size: \(targetSize)")
        print("View Bounds: \(view?.bounds ?? .zero)")

        // Use renderer to create the snapshot
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            view?.drawHierarchy(in: view!.bounds, afterScreenUpdates: true)
        }
    }
}

extension PlannerCreationView {
    func saveModel() {
        let fileName = UUID().uuidString
        let image = drawingElement.snapshot()
        viewModel.imageSnapShoot = image
        if let imagePath = ImageSaver.shared.saveImageToDocumentsDirectory(image: image, fileName: fileName) {
            let newModel = PlannerModel(name: viewModel.plannerName, description: viewModel.plannerDescription, planImage: fileName)
            AppData.shared.plannerArray.append(newModel)
            AppData.shared.savePlanners()
            AppData.shared.userStat.plannersAdd()
            AppData.shared.saveUserStats()
            let message = DemoMessage(title: "Planner Sucesful Saved!", body: "you back to main screen")
            let messageView = MessageHostingView(id: message.id, content: DemoMessageView(message: message))
            SwiftMessages.show(view: messageView)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.viewModel.backToMain()
            }
        } else {
            print("Error saving image")
            let message = DemoMessage(title: "Error in Saving image", body: "something was broken")
            let messageView = MessageHostingView(id: message.id, content: DemoMessageView(message: message))
            SwiftMessages.show(view: messageView)
        }
    }
}
