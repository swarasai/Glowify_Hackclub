//
//  ViewController.swift
//  Glorify_App
//
//  Created by Akarsh Shetty on 2/3/24.
//
import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var circularButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu Bar"
        let aboutMeButton = UIBarButtonItem(title: "About Me", style: .plain, target: self, action: #selector(aboutMeButtonTapped))
        navigationItem.rightBarButtonItem = aboutMeButton
        // Make the button circular
        circularButton.layer.cornerRadius = circularButton.frame.size.width / 2
        circularButton.clipsToBounds = true
        // Add a target to the button for the tap event
        circularButton.addTarget(self, action: #selector(circularButtonTapped), for: .touchUpInside)
    }
    @objc func circularButtonTapped() {
        // Implement the logic to open the camera and take pictures
        openCamera()
    }
    @objc func aboutMeButtonTapped() {
        // Code to navigate to the "About Me" page
        let aboutMeViewController = AboutMeViewController() // Replace with the actual class name of your "About Me" view controller
        navigationController?.pushViewController(aboutMeViewController, animated: true)
    }
    // Function to open the camera
    func openCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        // Present the image picker
        present(imagePicker, animated: true, completion: nil)
    }
}
// Implement UIImagePickerControllerDelegate to handle image capture
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Handle the captured image here
        if let image = info[.originalImage] as? UIImage {
            // Save the image to the document directory or perform any required actions
            saveImageToDocumentDirectory(image: image)
        }
        // Dismiss the image picker
        picker.dismiss(animated: true, completion: nil)
    }
    // Function to save the image to the document directory
    func saveImageToDocumentDirectory(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent("faceImage1.jpg")
            do {
                try imageData.write(to: fileURL)
            } catch {
                print("Error saving image: \(error)")
            }
        }
    }
}

