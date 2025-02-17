//
//  SetupProfileViewController.swift
//  IChat
//
//  Created by Ramil Davletshin on 18.12.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit
import FirebaseAuth
import SDWebImage


class SetupProfileViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "Set up profile!", font: .avenir26())
    let fullNameLabel = UILabel(text: "Full name")
    let aboutMeLabel = UILabel(text: "About me")
    let sexLabel = UILabel(text: "Sex")
    
    let fullNameTextField = OneLineTextField(withUniqStyle: true, font: .avenir20())
    let aboutMeTextField = OneLineTextField(withUniqStyle: true, font: .avenir26())
    let sexSegmentedControl = UISegmentedControl(first: "Male", second: "Female")
    let goToChatsButton = UIButton(title: "Go to chats!", titleColor: .white, backgroundColor: .buttonDark)
    let fullImageView = AddPhotoView()
    
    private let currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
        
        if let username = currentUser.displayName {
            fullNameTextField.text = username
        }
        if let photoURL = currentUser.photoURL {
            fullImageView.circleImageView.sd_setImage(with: photoURL, completed: nil)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainWhite
        setupConstraints()
        
        goToChatsButton.addTarget(self, action: #selector(goToChatsButtonTapped), for: .touchUpInside)
        fullImageView.plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    @objc private func plusButtonTapped() {
        let imgPickerController = UIImagePickerController()
        imgPickerController.delegate = self
        imgPickerController.sourceType = .photoLibrary
        present(imgPickerController, animated: true, completion: nil)
    }
    
    @objc private func goToChatsButtonTapped() {
        guard let currentUserEmail = currentUser.email else { return }
        FirestoreService.shared.saveProfileWith(id: currentUser.uid,
                                                email: currentUserEmail,
                                                username: fullNameTextField.text,
                                                avatarImage: fullImageView.circleImageView.image,
                                                description: aboutMeTextField.text,
                                                sex: sexSegmentedControl.titleForSegment(at: sexSegmentedControl.selectedSegmentIndex)) { (result) in
                                                    switch result {
                                                    case .success(let muser):
                                                        self.showAlert(with: "Успешно", and: "Данные сохранены!") {
                                                            let mainTabBar = MainTabBarController(currentUser: muser)
                                                            mainTabBar.modalPresentationStyle = .fullScreen
                                                            self.present(mainTabBar, animated: true, completion: nil)
                                                        }
                                                    case .failure(let error):
                                                        self.showAlert(with: "Ошибка!", and: error.localizedDescription)
                                                    }
        }
    }
    
    // MARK: - setup constraints
    private func setupConstraints() {
        let fullNameStackView = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTextField], axis: .vertical, spacing: 0)
        let aboutMeStackView = UIStackView(arrangedSubviews: [aboutMeLabel, aboutMeTextField], axis: .vertical, spacing: 0)
        let sexStackView = UIStackView(arrangedSubviews: [sexLabel, sexSegmentedControl], axis: .vertical, spacing: 12)
        let stackView = UIStackView(arrangedSubviews: [fullNameStackView, aboutMeStackView, sexStackView, goToChatsButton], axis: .vertical, spacing: 40)
        
        view.addSubview(welcomeLabel)
        view.addSubview(fullImageView)
        view.addSubview(stackView)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        
        goToChatsButton.heightAnchor.constraint(equalToConstant: 60).activate
        
        welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).activate
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate
        fullImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40).activate
        fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate
        stackView.topAnchor.constraint(equalTo: fullImageView.bottomAnchor, constant: 40).activate
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).activate
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).activate
    }
    
    deinit {
           print("SetupProfileViewController deinit")
    }
    
}


// MARK: - UINavigationControllerDelegate, UIImagePickerControllerDelegate
extension SetupProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        fullImageView.circleImageView.image = image
    }
}


// MARK: - Canvas
import SwiftUI

struct SetupProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SetupProfileViewController(currentUser: Auth.auth().currentUser!)
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SetupProfileVCProvider.ContainerView>) ->  UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: SetupProfileVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SetupProfileVCProvider.ContainerView>) {
            
        }
        
    }
}
