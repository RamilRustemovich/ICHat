//
//  OneLineTextField.swift
//  IChat
//
//  Created by Ramil Davletshin on 18.12.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit

final class OneLineTextField: UITextField {
       
    convenience init(withUniqStyle style: Bool, font: UIFont?) {
        self.init()

        self.font = font
        self.borderStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false

        if style {
            var bottomView = UIView()
            bottomView = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            bottomView.backgroundColor = .textFieldLight
            bottomView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(bottomView)

            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor).activate
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor).activate
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor).activate
            bottomView.heightAnchor.constraint(equalToConstant: 1).activate

        }
    }
}
        
        
