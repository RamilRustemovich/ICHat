//
//  ChatRequestViewController.swift
//  IChat
//
//  Created by Ramil Davletshin on 24.01.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import UIKit


final class ChatRequestViewController: UIViewController {
    
    let containerView = UIView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human7"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "pet ben", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "You have the opportunity to start a new chat", font: .systemFont(ofSize: 16, weight: .light))
    let acceptButton = UIButton(title: "ACCEPT", titleColor: .white, backgroundColor: .black, font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    let denyButton = UIButton(title: "Deny", titleColor: #colorLiteral(red: 0.8352941176, green: 0.2, blue: 0.2, alpha: 1), backgroundColor: .mainWhite, font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    private var chat: MChat
    weak var delegate: WaitingChatsNavigation?
    
    init(chat: MChat) {
        self.chat = chat
        nameLabel.text = chat.friendUsername
        imageView.sd_setImage(with: URL(string: chat.friendUserAvatarStringURL), completed: nil)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainWhite
        setupConstraints()
        
        denyButton.addTarget(self, action: #selector(denyButtonTapped), for: .touchUpInside)
        acceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        acceptButton.applyGradients(cornerRadius: 10)
    }
    
    @objc private func denyButtonTapped() {
        self.dismiss(animated: true) {
            self.delegate?.removeWaitingChat(chat: self.chat)
        }
    }
    
    @objc private func acceptButtonTapped() {
        self.dismiss(animated: true) {
            self.delegate?.changeToActive(chat: self.chat)
        }
    }
    
    private func setupConstraints() {
        denyButton.layer.borderWidth = 1.2
        denyButton.layer.borderColor = #colorLiteral(red: 0.8352941176, green: 0.2, blue: 0.2, alpha: 1)
        containerView.backgroundColor = .mainWhite
        containerView.layer.cornerRadius = 30
    
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
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
        
        let buttonStackView = UIStackView(arrangedSubviews: [acceptButton, denyButton], axis: .horizontal, spacing: 7)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.distribution = .fillEqually
        containerView.addSubview(buttonStackView)
        
        buttonStackView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 24).activate
        buttonStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).activate
        buttonStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24).activate
        buttonStackView.heightAnchor.constraint(equalToConstant: 56).activate
        
        
    }
    
}


// MARK: - Canvas
import SwiftUI

struct ChatRequestVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = ChatRequestViewController(chat: MChat(friendUsername: "", friendUserAvatarStringURL: "", lastMessageContent: "", friendId: ""))
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ChatRequestVCProvider.ContainerView>) ->  UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: ChatRequestVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ChatRequestVCProvider.ContainerView>) {
            
        }
        
    }
}

