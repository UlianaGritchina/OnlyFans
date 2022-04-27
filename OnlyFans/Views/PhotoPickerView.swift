//
//  PhotoPicker.swift
//  Test
//
//  Created by Ульяна Гритчина on 12.04.2022.
//

import SwiftUI

struct PhotoPickerView: UIViewControllerRepresentable {
    var imageData: Data
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self, imageData: imageData)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker: PhotoPickerView
        var imageData: Data
        
        init(photoPicker: PhotoPickerView, imageData: Data) {
            self.photoPicker = photoPicker
            self.imageData = imageData
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                guard let data = image.jpegData(compressionQuality: 0.5) else {
                    return
                }
                
                UserDefaults.standard.set(data, forKey: "CoverImageData")
                
                imageData = data
                
                
            } else {
                
            }
            picker.dismiss(animated: true)
        }
    }
    
}
