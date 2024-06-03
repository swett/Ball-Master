//
//  DravwView.swift
//  Ball Master
//
//  Created by admin on 31.05.2024.
//

import SwiftUI
import PencilKit
struct DravwView: View {
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State var undoManager = UndoManager()
    var body: some View {
        ZStack {
            DrawingView(canvas: $canvas, isDrawing: $isDraw)
        }
        
    }
}

#Preview {
    DravwView()
        .background(Color.theme.backgroundColor)
}


struct DrawingView: UIViewRepresentable {
    @Binding var canvas: PKCanvasView
    @Binding var isDrawing: Bool
    var undoAction: (() -> Void)?

    let ink = PKInkingTool(.marker, color: .white)
    let eraser = PKEraserTool(.bitmap)
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = .anyInput
        canvas.tool = isDrawing ? ink : eraser
        canvas.backgroundColor = .clear
        canvas.delegate = context.coordinator
        canvas.overrideUserInterfaceStyle = .light
        return canvas
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        uiView.tool = isDrawing ? ink : eraser
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PKCanvasViewDelegate {
        var parent: DrawingView

        init(_ parent: DrawingView) {
            self.parent = parent
        }

        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            parent.undoAction?()
        }
    }
}


extension DrawingView {
    func undo() {
        if $canvas.wrappedValue.drawing.strokes.count > 0 {
            $canvas.wrappedValue.undoManager?.undo()
            }
        }

        func redo() {
            if $canvas.wrappedValue.drawing.strokes.count > 0 {
                $canvas.wrappedValue.undoManager?.redo()
            }
        }

    func save() -> UIImage? {
        let image = canvas.drawing.image(from: canvas.bounds, scale: 1.0)
        return image
    }
}


//class PKCanvasController {
//var canvas = PKCanvasView()
//var drawings = [PKDrawing]()
//var didRemove = false
//
//func clear() {
//    canvas.drawing = PKDrawing()
//    drawings = [PKDrawing]()
//}
//
//func undoDrawing() {
//    if !drawings.isEmpty {
//        didRemove = true
//        drawings.removeLast()
//        canvas.drawing = drawings.last ?? PKDrawing()
//        didRemove = false
//    }
//}
//}
