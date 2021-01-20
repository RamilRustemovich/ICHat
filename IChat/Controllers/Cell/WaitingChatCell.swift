//
//  WaitingChatCell.swift
//  IChat
//
//  Created by Ramil Davletshin on 16.01.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import UIKit

class WaitingChatCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "WaitingChatCell"
    
    let friendImageView = UIImageView()
    
    
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
    
    
    func configure<U>(with value: U) where U : Hashable {//func configure(with value: MChat) {
        guard let chat: MChat = value as? MChat else {
            return
        }
        friendImageView.image = UIImage(named: chat.userImageString)
    }
    
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(friendImageView)
        
        friendImageView.fillSuperview()
//        friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).activate
//        friendImageView.topAnchor.constraint(equalTo: self.topAnchor).activate
//        friendImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).activate
//        friendImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).activate
    }
    
}



// MARK: - Canvas
import SwiftUI

struct WaitingChatProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<WaitingChatProvider.ContainerView>) ->  UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: WaitingChatProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<WaitingChatProvider.ContainerView>) {
            
        }
        
    }
}
