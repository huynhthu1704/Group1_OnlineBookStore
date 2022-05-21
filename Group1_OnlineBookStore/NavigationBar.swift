//
//  NavigationBar.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-20.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import UIKit

class NavigationBar {
    let navigationController : UINavigationController?
    let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
    let navBar : UINavigationBar?
    
    init(navigationController : UINavigationController?) {
        self.navigationController = navigationController
        self.navBar = self.navigationController?.navigationBar
    }
   public func setUp() {
        navBar!.setValue(true, forKey: "hidesShadow")
             navBar!.tintColor = UIColor.white
             // Change nav's color
             navBar!.barTintColor = UIColor(red: 0.26, green: 0.36, blue: 0.86, alpha: 1)
             navBar!.titleTextAttributes = [.foregroundColor : UIColor.white]
             navBar!.isTranslucent = false

    }
    public func addSearchBarItem(navigationItem : UINavigationItem) {
        print("Searchbar")
        searchBar.placeholder = "Find interesting book"
        self.searchBar.searchTextField.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar)
        // Set Cart bar button item
    }
    
    public func addCartItem(navigationItem : UINavigationItem) {
        let cartBtn = UIButton(type: .custom)
        let cartBtnImage = UIImage(systemName: "cart")
        cartBtn.setBackgroundImage(cartBtnImage, for: .normal)
        cartBtn.imageView?.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
        cartBtn.addTarget(self, action: #selector(goToShoppingCart), for: .touchUpInside)
        cartBtn.frame = CGRect(x:0, y: 0, width: 35, height: 35)
        
        let cartView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        cartView.addSubview(cartBtn)
        let cartButton = UIBarButtonItem(customView: cartView)
        navigationItem.rightBarButtonItem = cartButton
    }
    
    @objc func goToShoppingCart() {
           let shoppingCartVC = ShoppingCartViewController(nibName: "ShoppingCartViewController", bundle: nil)
           self.navigationController?.pushViewController(shoppingCartVC, animated: true)
       }
    
}
     
