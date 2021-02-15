//
//  AddPhotoView.swift
//  IChat
//
//  Created by Ramil Davletshin on 18.12.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit

final class AddPhotoView: UIView {
    
    let circleImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = #imageLiteral(resourceName: "avatar")
        imgView.contentMode = .scaleAspectFill//.center
        imgView.clipsToBounds = true
        imgView.layer.borderColor = UIColor.black.cgColor
        imgView.layer.borderWidth = 1
        return imgView
    }()
    
    let plusButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        btn.tintColor = .buttonDark
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(circleImageView)
        addSubview(plusButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.masksToBounds = true
        circleImageView.layer.cornerRadius = circleImageView.frame.width / 2
    }
    
    private func setupConstraints() {
        circleImageView.topAnchor.constraint(equalTo: self.topAnchor).activate
        circleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).activate
        circleImageView.widthAnchor.constraint(equalToConstant: 100).activate
        circleImageView.heightAnchor.constraint(equalToConstant: 100).activate
        
        plusButton.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 16).activate
        plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).activate
        plusButton.widthAnchor.constraint(equalToConstant: 30).activate
        plusButton.heightAnchor.constraint(equalToConstant: 30).activate
        
        bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor).activate
        trailingAnchor.constraint(equalTo: plusButton.trailingAnchor).activate
    }
    
    
    
    
}
