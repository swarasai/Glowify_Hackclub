//
//  YourViewController.swift
//  Glorify_App
//
//  Created by Akarsh Shetty on 2/3/24.
//
import Foundation
import UIKit
class YourViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a right bar button item
        let aboutMeButton = UIBarButtonItem(title: "About Me", style: .plain, target: self, action: #selector(aboutMeButtonTapped))
        // Assign the button to the navigation item
        navigationItem.rightBarButtonItem = aboutMeButton
    }
    @objc func aboutMeButtonTapped() {
        // Instantiate and present the "About Me" view controller
        let aboutMeViewController = AboutMeViewController()
        present(aboutMeViewController, animated: true, completion: nil)
    }
}
class AboutMeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Customize your "About Me" view controller here
        let titleLabel = UILabel()
        titleLabel.text = "u"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        // Add constraints as needed
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}



