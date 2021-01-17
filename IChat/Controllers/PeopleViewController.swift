//
//  PeopleViewController.swift
//  IChat
//
//  Created by Ramil Davletshin on 22.12.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        setupSearchBar()
    }
    
    
    private func setupSearchBar() {
          navigationController?.navigationBar.barTintColor = .mainWhite
          navigationController?.navigationBar.shadowImage = UIImage()
          
          let searchController = UISearchController(searchResultsController: nil)
          navigationItem.searchController = searchController
          navigationItem.hidesSearchBarWhenScrolling = false
          searchController.hidesNavigationBarDuringPresentation = false
          searchController.obscuresBackgroundDuringPresentation = false
          searchController.searchBar.delegate = self
      }
    
}



// MARK: - UISearchBarDelegate
extension PeopleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}


// MARK: - Canvas
import SwiftUI

struct PeopleVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<PeopleVCProvider.ContainerView>) ->  UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: PeopleVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<PeopleVCProvider.ContainerView>) {
            
        }
        
    }
}
