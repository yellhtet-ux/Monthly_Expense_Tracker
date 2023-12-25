//
//  ImagePicker.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 12/25/23.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Binding var isImageSelected : Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

class Coordinator : NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var parent : ImagePicker
    
    init(_ picker: ImagePicker) {
        self.parent = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            DispatchQueue.main.async {
                self.parent.selectedImage = image
            }
        }
        self.parent.isImageSelected = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.parent.isImageSelected = false
    }
}
