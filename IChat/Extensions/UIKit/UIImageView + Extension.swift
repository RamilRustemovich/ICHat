//
//  UIImageView + Extension.swift
//  IChat
//
//  Created by Ramil Davletshin on 16.12.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
    
}
