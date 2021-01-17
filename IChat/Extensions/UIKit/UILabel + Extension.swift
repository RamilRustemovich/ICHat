//
//  UILabel + Extension.swift
//  IChat
//
//  Created by Ramil Davletshin on 16.12.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit


extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir20()) {
        self.init()
        
        self.text = text
        self.font = font
    }
}
