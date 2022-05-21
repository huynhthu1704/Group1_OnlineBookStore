//
//  BookListViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-21.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextViewDelegate {
    let identifier = "BookCell"
     let searchBar = UISearchBar(frame: CGRect(x: 0, y: -5, width: 300, height: 20))
    var cartButton = UIBarButtonItem()
    var isSearchBarShown = false
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viewNewBooks: RoundedButton!
    @IBOutlet weak var viewTopSaleBook: RoundedButton!
    @IBAction func viewAllBook(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = NavigationBar(navigationController: self.navigationController)
        nav.setUp()
         addRightBarButtonItem()
        addSearchBarItem()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "BookCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
        
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
//        addSearchBarItem()
        self.isSearchBarShown = !self.isSearchBarShown
        self.searchBar.isHidden = isSearchBarShown
              navigationItem.rightBarButtonItems = nil
            self.searchBar.searchTextField.becomeFirstResponder()
      
    }
    
    public func addSearchBarItem() {
        print("Searchbar")
       
        self.searchBar.placeholder = "Find interesting book"
        self.searchBar.searchTextField.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.searchBar)
        searchBar.isHidden = !isSearchBarShown
    }
    
    override func resignFirstResponder() -> Bool {
        print(self.searchBar.searchTextField.text as Any)
        addRightBarButtonItem()
        return true
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Set top Sale collection view's height equal to its child cell
        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let height = flow.collectionViewContentSize.height
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 10
        collectionHeight.constant = height
        collectionView.collectionViewLayout = flow
        collectionView.reloadData()
        self.view.layoutIfNeeded()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! BookCollectionViewCell
        let book = books[indexPath.row]
        cell.img.image  = book.slug
        cell.name.text = book.name
        cell.price.text = String(book.price)
        return cell
    }
}
extension BookListViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: 280)
    }
}



