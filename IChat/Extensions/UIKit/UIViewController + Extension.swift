//
//  UIViewController + Extension.swift
//  IChat
//
//  Created by Ramil Davletshin on 20.01.2021.
//  Copyright © 2021 Ramil Davletshin. All rights reserved.
//

import UIKit


extension UIViewController {
    
    func configure<T: SelfConfiguringCell, U: Hashable>(collectionView: UICollectionView, cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {
             fatalError("Unable to dequeue \(cellType)")
         }
         
         cell.configure(with: value)
         return cell
     }
    
}




