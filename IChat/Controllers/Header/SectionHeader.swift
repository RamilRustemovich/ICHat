//
//  SectionHeader.swift
//  IChat
//
//  Created by Ramil Davletshin on 18.01.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import UIKit

final class SectionHeader: UICollectionReusableView {
    
    static let reuseId = "SectionHeader"
    
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        
        title.topAnchor.constraint(equalTo: topAnchor).activate
        title.leadingAnchor.constraint(equalTo: leadingAnchor).activate
        title.trailingAnchor.constraint(equalTo: trailingAnchor).activate
        title.bottomAnchor.constraint(equalTo: bottomAnchor).activate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String, font: UIFont?, textColor: UIColor) {
        title.text = text
        title.textColor = textColor
        title.font = font
    }
    
}
