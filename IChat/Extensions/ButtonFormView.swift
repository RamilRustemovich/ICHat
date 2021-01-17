//
//  ButtonFormView.swift
//  IChat
//
//  Created by Ramil Davletshin on 17.12.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit

final class ButtonFormView: UIView {
    
    init(label: UILabel, button: UIButton) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(label)
        self.addSubview(button)
        
        label.topAnchor.constraint(equalTo: topAnchor).activate
        label.leadingAnchor.constraint(equalTo: leadingAnchor).activate
        
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).activate
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor).activate
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor).activate
        button.heightAnchor.constraint(equalToConstant: 60).activate
        
        self.bottomAnchor.constraint(equalTo: button.bottomAnchor).activate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
