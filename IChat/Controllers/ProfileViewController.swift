//
//  ProfileViewController.swift
//  IChat
//
//  Created by Ramil Davletshin on 24.01.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    let containerView = UIView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human7"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "pet ben", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "You have the...", font: .systemFont(ofSize: 16, weight: .light))
    let messageTextField = InsertableTextField()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainWhite
        setupConstraints()
        
        if let button = messageTextField.rightView as? UIButton {
            button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        }
    }
    
    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.numberOfLines = 0
        
        containerView.backgroundColor = .mainWhite
        containerView.layer.cornerRadius = 30
        
        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(messageTextField)
        containerView.addSubview(aboutMeLabel)
        
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).activate
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate
        containerView.heightAnchor.constraint(equalToConstant: 206).activate
        
        imageView.topAnchor.constraint(equalTo: view.topAnchor).activate
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate
        imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).activate
        
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35).activate
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).activate
        nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24).activate
        
        aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).activate
        aboutMeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).activate
        aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24).activate
        
        messageTextField.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 8).activate
        messageTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).activate
        messageTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24).activate
        messageTextField.heightAnchor.constraint(equalToConstant: 48).activate

    }
    
    @objc private func sendMessage() {
        
    }
    
}


// MARK: - Canvas
import SwiftUI

struct ProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = ProfileViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ProfileVCProvider.ContainerView>) ->  UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: ProfileVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ProfileVCProvider.ContainerView>) {
            
        }
        
    }
}



