//
//  CategoryCollectionViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-20.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CategoryCollectionViewController: UICollectionViewController {
    
    let searchBar = UISearchBar(frame: CGRect(x: 0, y: -5, width: 300, height: 20))
    var isSearchBarShown = false
    var cartButton = UIBarButtonItem()
    var categories = [Category]()
    @IBOutlet weak var categoryCollectionViewHeight: NSLayoutConstraint!
    //    override func viewDidLayoutSubviews() {
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        
    }
    override func viewDidLoad(  ) {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false
        let nav = NavigationBar(navigationController: self.navigationController)
        nav.setUp()
        //        nav.addSearchBarItem(navigationItem: navigationItem)
        addRightBarButtonItem()
        // Register cell classes
        self.collectionView!.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.dataSource = self
        self.collectionView!.delegate = self
        self.collectionView!.collectionViewLayout = UICollectionViewFlowLayout()
    }
    func addRightBarButtonItem() {
        // Set Cart bar button item
        let cartBtn = UIButton(type: .custom)
        let cartBtnImage = UIImage(systemName: "cart")
        cartBtn.setBackgroundImage(cartBtnImage, for: .normal)
        cartBtn.addTarget(self, action: #selector(goToShoppingCart), for: .touchUpInside)
        cartBtn.frame = CGRect(x:0, y: 0, width: 35, height: 35)
        
        let cartView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        cartView.addSubview(cartBtn)
        cartButton = UIBarButtonItem(customView: cartView)
        navigationItem.rightBarButtonItem = cartButton
        
        // Set Search bar button item
        let searchBtn = UIButton(type: .custom)
        let backBtnImage1 = UIImage(systemName: "magnifyingglass")
        searchBtn.setBackgroundImage(backBtnImage1, for: .normal)
        searchBtn.addTarget(self, action: #selector(search), for: .touchUpInside)
        searchBtn.frame = CGRect(x:0, y:0, width: 35, height: 35)
        let searchView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        searchView.addSubview(searchBtn)
        let searchButton = UIBarButtonItem(customView: searchView)
        navigationItem.rightBarButtonItems?.append(cartButton)
        navigationItem.rightBarButtonItems?.append(searchButton)
    }
    
    @objc func goToShoppingCart() {
        let shoppingCartVC = ShoppingCartViewController(nibName: "ShoppingCartViewController", bundle: nil)
        self.navigationController?.pushViewController(shoppingCartVC, animated: true)
    }
    @objc func search() {
        if isSearchBarShown {
            navigationItem.leftBarButtonItem = nil
            print("result")
        } else {
            addSearchBarItem()
        }
        isSearchBarShown = !isSearchBarShown
    }
    
    public func addSearchBarItem() {
        print("Searchbar")
        
        self.searchBar.placeholder = "Find interesting book"
        self.searchBar.searchTextField.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.searchBar)
        //        searchBar.isHidden = !isSearchBarShown
    }
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of item
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
        let category : Category = categories[indexPath.row]
        //        cell.img.image = category.img
        cell.name.text = category.name
        
        return cell
    }
}
extension CategoryCollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: 220)
    }
}
