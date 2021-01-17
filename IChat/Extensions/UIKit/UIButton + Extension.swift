//
//  UIButton + Extension.swift
//  IChat
//
//  Created by Ramil Davletshin on 16.12.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import Foundation
import UIKit


extension UIButton {
    
    convenience init(title: String, titleColor: UIColor, backgroundColor: UIColor, font: UIFont? = .avenir20(), isShadow: Bool = false, cornerRadius: CGFloat = 4) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        titleLabel?.font = font
        
        layer.cornerRadius = cornerRadius
        if isShadow {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 4
            layer.shadowOpacity = 0.2
            layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
    
    func customizeGoogleButton() {
        let googleLogo = UIImageView(image: #imageLiteral(resourceName: "googleLogo"), contentMode: .scaleAspectFit)
        googleLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(googleLogo)
        googleLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).activate
        googleLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 2).activate
    }
    
}
