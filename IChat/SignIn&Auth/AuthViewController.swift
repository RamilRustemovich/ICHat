//
//  ViewController.swift
//  IChat
//
//  Created by Ramil Davletshin on 15.12.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .buttonDark)
    let loginButton = UIButton(title: "Login", titleColor: .buttonRed, backgroundColor: .white, isShadow: true)
    
    let googleLabel = UILabel(text: "Get started with")
    let emailLabel = UILabel(text: "Or sign up with")
    let alreadyOnBoardLabel = UILabel(text: "Already onboard?")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleButton.customizeGoogleButton()
        view.backgroundColor = .mainWhite
        setupConstraints()
    }

    // MARK: - setupConstraints
    private func setupConstraints() {
       
        let googleView = ButtonFormView(label: googleLabel, button: googleButton)
        let emailView = ButtonFormView(label: emailLabel, button: emailButton)
        let loginView = ButtonFormView(label: alreadyOnBoardLabel, button: loginButton)
       
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView], axis: .vertical, spacing: 40)
        stackView.translatesAutoresizingMaskIntoConstraints = false
      
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).activate //160
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate
        
        stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120).activate //160
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).activate
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).activate
        
    }

}




// MARK: - Canvas
import SwiftUI

struct AuthVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = AuthViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AuthVCProvider.ContainerView>) ->  UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: AuthVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AuthVCProvider.ContainerView>) {
            
        }
        
    }
}
