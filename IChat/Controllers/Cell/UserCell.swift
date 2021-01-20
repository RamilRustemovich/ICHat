//
//  UserCell.swift
//  IChat
//
//  Created by Ramil Davletshin on 20.01.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import UIKit

final class UserCell: UICollectionViewCell, SelfConfiguringCell {
    
    static let reuseId: String = "UserCell"
    
    let userImageView = UIImageView()
    let userNameLabel = UILabel(text: "", font: .laoSangamMN20())
    let containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupConstraints()
        
        layer.shadowColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.layer.cornerRadius = 4
        self.containerView.clipsToBounds = true
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let user: MUser = value as? MUser else { return }
        userImageView.image = UIImage(named: user.avatarStringURL)
        userNameLabel.text = user.username
    }
    
    private func setupConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerView)
        containerView.addSubview(userImageView)
        containerView.addSubview(userNameLabel)
        
        containerView.fillSuperview()
        
//        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).activate
//        containerView.topAnchor.constraint(equalTo: self.topAnchor).activate
//        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).activate
//        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).activate
        
        userImageView.topAnchor.constraint(equalTo: containerView.topAnchor).activate
        userImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).activate
        userImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).activate
        userImageView.heightAnchor.constraint(equalTo: containerView.widthAnchor).activate
        
        userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor).activate
        userNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).activate
        userNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).activate
        userNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).activate
        
    }
    
    
}


// MARK: - Canvas
import SwiftUI

struct UserChatProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<UserChatProvider.ContainerView>) ->  UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UserChatProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<UserChatProvider.ContainerView>) {
            
        }
        
    }
}
