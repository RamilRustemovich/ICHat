//
//  SignUpViewController.swift
//  IChat
//
//  Created by Ramil Davletshin on 17.12.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit


class SignUpViewController: UIViewController {
    
    weak var delegate: AuthNavigatingDelegate?
    
    let welcomeLabel = UILabel(text: "Good to see you!", font: .avenir26())
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let confirmPasswordLabel = UILabel(text: "Confirm password")
    let alreadyOnboardLabel = UILabel(text: "Already onboard?")
    
    let emailTextField = OneLineTextField(withUniqStyle: true, font: .avenir20())
    let passwordTextField = OneLineTextField(withUniqStyle: true, font: .avenir20())
    let confirmPasswordTextField = OneLineTextField(withUniqStyle: true, font: .avenir20())
    
    let signUpButton = UIButton(title: "Sign up", titleColor: .white, backgroundColor: .buttonDark)
    let loginButton: UIButton = {
        let  btn = UIButton(type: .system)
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.buttonRed, for: .normal)
        btn.titleLabel?.font = .avenir20()
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - button targets
     @objc private func signUpButtonTapped() {
        AuthService.shared.register(email: emailTextField.text, password: passwordTextField.text, confirmPassword: confirmPasswordTextField.text) { (result) in
            switch result {
            case .success(let user):
                self.showAlert(with: "Success", and: "You're registered!") {
                    self.present(SetupProfileViewController(currentUser: user), animated: true, completion: nil)
                }
                
            case .failure(let error):
                self.showAlert(with: "Error", and: error.localizedDescription)
            }
        }
     }
    
    @objc private func loginButtonTapped() {
        dismiss(animated: true) {
            self.delegate?.toLoginVC()
        }
    }
    
    
    // MARK: - setup constraints
    private func setupConstraints() {
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
        let confirmPasswordStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField], axis: .vertical, spacing: 0)
        signUpButton.heightAnchor.constraint(equalToConstant: 60).activate
        
        let stackView = UIStackView(arrangedSubviews: [emailStackView, passwordStackView, confirmPasswordStackView, signUpButton], axis: .vertical, spacing: 40)
        let bottomStackView = UIStackView(arrangedSubviews: [alreadyOnboardLabel, loginButton], axis: .horizontal, spacing: 10)
        bottomStackView.alignment = .firstBaseline
        loginButton.contentHorizontalAlignment = .leading
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).activate  //160
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate
        
        stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 90).activate //160
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).activate
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).activate
        
        bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60).activate
        bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).activate
        bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).activate
    }
}




// MARK: - Canvas
import SwiftUI

struct SignUpVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SignUpViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SignUpVCProvider.ContainerView>) ->  UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: SignUpVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SignUpVCProvider.ContainerView>) {
            
        }
        
    }
}




extension UIViewController {
    func showAlert(with title: String, and message: String, completion: @escaping () -> () = {} ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
