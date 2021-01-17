//
//  StackView + Extension.swift
//  IChat
//
//  Created by Ramil Davletshin on 17.12.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
    }
}
