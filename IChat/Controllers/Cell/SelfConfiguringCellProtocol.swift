//
//  SelfConfiguringCellProtocol.swift
//  IChat
//
//  Created by Ramil Davletshin on 16.01.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
