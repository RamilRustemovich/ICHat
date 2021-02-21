//
//  ActiveChatCell.swift
//  IChat
//
//  Created by Ramil Davletshin on 16.01.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import UIKit
import SDWebImage


class ActiveChatCell: UICollectionViewCell, SelfConfiguringCell {
    
    static let reuseId: String = "ActiveChatCell"
    let friendImageView = UIImageView()
    let friendName = UILabel(text: "User name", font: .laoSangamMN20())
    let lastMessage = UILabel(text: "How are you?", font: .laoSangamMN18())
    let gradientView = GradientView(from: .topTrailing, to: .bottomLeading, startColor: #colorLiteral(red: 0.7882352941, green: 0.631372549, blue: 0.9411764706, alpha: 1), endColor: #colorLiteral(red: 0.4784313725, green: 0.6980392157, blue: 0.9215686275, alpha: 1))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupConstraints()
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure<U>(with value: U) where U : Hashable {
        guard let value: MChat = value as? MChat else {
            return
        }
        friendImageView.sd_setImage(with: URL(string: value.friendUserAvatarStringURL), completed: nil)
        friendName.text = value.friendUsername
        lastMessage.text = value.lastMessageContent
    }
    
    // MARK: - setup constraints
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(friendImageView)
        addSubview(gradientView)
        addSubview(friendName)
        addSubview(lastMessage)
        
        friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).activate
        friendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).activate
        friendImageView.heightAnchor.constraint(equalToConstant: 78).activate
        friendImageView.widthAnchor.constraint(equalToConstant: 78).activate
        
        gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor).activate
        gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor).activate
        gradientView.heightAnchor.constraint(equalToConstant: 78).activate
        gradientView.widthAnchor.constraint(equalToConstant: 8).activate
        
        friendName.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).activate
        friendName.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16).activate
        friendName.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16).activate
        
        lastMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14).activate
        lastMessage.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16).activate
        lastMessage.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16).activate
    }
    
}



// MARK: - Canvas
import SwiftUI

struct ActiveChatProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ActiveChatProvider.ContainerView>) ->  UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: ActiveChatProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ActiveChatProvider.ContainerView>) {
            
        }
        
    }
}
