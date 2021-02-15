//
//  LoginViewController.swift
//  IChat
//
//  Created by Ramil Davletshin on 18.12.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit
import GoogleSignIn


class LoginViewController: UIViewController {
    
    weak var delegate: AuthNavigatingDelegate?
    
    let welcomeLabel = UILabel(text: "Welcome back!", font: .avenir26())
    let loginWithLabel = UILabel(text: "Login with")
    let orLabel = UILabel(text: "or")
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let NeedAnAccountLabel = UILabel(text: "Need an account?")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    
    let emailTextField = OneLineTextField(withUniqStyle: true, font: .avenir20())
    let passwordTextField = OneLineTextField(withUniqStyle: true, font: .avenir20())
    
    let loginButton = UIButton(title: "Login", titleColor: .white, backgroundColor: .buttonDark)
    let signUpButton: UIButton = {
        let  btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(.buttonRed, for: .normal)
        btn.titleLabel?.font = .avenir20()
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         view.backgroundColor = .white
        googleButton.customizeGoogleButton()
        setupConstraints()
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - button targets
    @objc private func loginButtonTapped() {
        AuthService.shared.login(email: emailTextField.text, password: passwordTextField.text) { (result) in
            switch result {
            case .success(let user):
                self.showAlert(with: "Success", and: "You're authorized!") {
                    print("authorized")
                    FirestoreService.shared.getUserData(user: user) { (result) in
                        switch result {
                        case .success(let muser):
                            print("success")
                            let mainTabBar = MainTabBarController(currentUser: muser)
                            mainTabBar.modalPresentationStyle = .fullScreen
                            self.present(mainTabBar, animated: true, completion: nil)
                        case .failure(_):
                            print("failure")
                            self.present(SetupProfileViewController(currentUser: user), animated: true, completion: nil)
                        }
                    }
                }
            case .failure(let error):
                self.showAlert(with: "Error", and: error.localizedDescription)
            }
        }
    }
    
    @objc private func signUpButtonTapped() {
        dismiss(animated: true) {
            self.delegate?.toSignUpVC()
        }
    }
    
    @objc private func googleButtonTapped() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
    }
    
        
    // MARK: - setup constraints
    private func setupConstraints() {
        let loginWithView = ButtonFormView(label: loginWithLabel, button: googleButton)
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
        
        loginButton.heightAnchor.constraint(equalToConstant: 60).activate
        let stackView = UIStackView(arrangedSubviews: [loginWithView, orLabel, emailStackView, passwordStackView, loginButton], axis: .vertical, spacing: 40)
        
        let bottomStackView = UIStackView(arrangedSubviews: [NeedAnAccountLabel, signUpButton], axis: .horizontal, spacing: 10)
        bottomStackView.alignment = .firstBaseline
        signUpButton.contentHorizontalAlignment = .leading
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).activate
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate
        
        stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 90).activate //160
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).activate
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).activate
        
        bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).activate
        bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).activate
        bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).activate
    }
    
}




// MARK: - Canvas
import SwiftUI

struct LoginVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = LoginViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) ->  UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: LoginVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) {
            
        }
        
    }
}
