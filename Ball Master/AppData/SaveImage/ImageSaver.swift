//
//  ImageSaver.swift
//  Ball Master
//
//  Created by admin on 03.06.2024.
//

import Foundation
import UIKit

class ImageSaver {
    static let shared = ImageSaver()
    
    private init() {}
    
    func saveImageToDocumentsDirectory(image: UIImage, fileName: String) -> String? {
        guard let data = image.jpegData(compressionQuality: 1.0) else { return nil }
        
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let fileURL = documentsDirectory.appendingPathComponent("\(fileName).jpg")
        
        do {
            try data.write(to: fileURL)
            return fileURL.path
        } catch {
            print("Error saving image: \(error)")
            return nil
        }
    }
}
