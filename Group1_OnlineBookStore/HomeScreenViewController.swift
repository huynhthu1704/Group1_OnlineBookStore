//
//  HomeScreenViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit
import FirebaseAuth
class HomeScreenViewController: UIViewController, UICollectionViewDelegate {
    //MARK: Properties
    let topSaleBook = [Book]()
    let topSaleBookIdentifier = "TopSaleBookCollectionViewCell"
    let newBookIdentifier = "NewBookCollectionViewCell"
    let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
    @IBOutlet weak var newBookCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var topSaleCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var newBookCollectionView: UICollectionView!
    @IBOutlet weak var topSaleCollectionView: UICollectionView!
    
    
    @IBOutlet weak var cartBarButtonitem: UIBarButtonItem!
    override func viewDidLayoutSubviews() {
        print("DidLayout")
        super.viewDidLayoutSubviews()
        // Set top Sale collection view's height equal to its child cell
        let flow = topSaleCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let heightTopSale = flow.collectionViewContentSize.height
        topSaleCollectionViewHeight.constant = heightTopSale
        topSaleCollectionView.collectionViewLayout = flow
        topSaleCollectionView.reloadData()

        // Set new book collection view's height equal to its child cell
        let heightNewBook = newBookCollectionView.collectionViewLayout.collectionViewContentSize.height
        newBookCollectionViewHeight.constant = heightNewBook
        self.view.layoutIfNeeded()
        newBookCollectionView.reloadData()
//          UIScreen.main.bounds.size.width
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Customer navigation bar
        let nav = NavigationBar(navigationController: self.navigationController)
        nav.setUp()
        nav.addSearchBarItem(navigationItem: navigationItem)
        nav.addCartItem(navigationItem: navigationItem)

        // Register datasource + nib collection view cell for topSale collection view
        topSaleCollectionView.register(UINib(nibName: "BookCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: topSaleBookIdentifier)
        topSaleCollectionView.dataSource = self
        topSaleCollectionView.delegate = self
        topSaleCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        // Register datasource + nib collection view cell for new product collection view
        newBookCollectionView.register(UINib(nibName: "BookCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: newBookIdentifier)
        newBookCollectionView.dataSource = self
        newBookCollectionView.delegate = self
        newBookCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    @objc func goToShoppingCart() {
        let shoppingCartVC = ShoppingCartViewController(nibName: "ShoppingCartViewController", bundle: nil)
        self.navigationController?.pushViewController(shoppingCartVC, animated: true)
    }
}
extension HomeScreenViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("count\(books.count)")
        
        return books.count
        //        if collectionView == self.topSaleCollectionView {
        //            return books.count
        //        } else {
        //            return books.count
        //        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("render1")
        
        if collectionView == topSaleCollectionView {
            print("renderTop")
            let cell = topSaleCollectionView.dequeueReusableCell(withReuseIdentifier: topSaleBookIdentifier, for: indexPath) as! BookCollectionViewCell
            let book : Book = books[indexPath.row]
            cell.img.image = book.slug
            cell.name.text = book.name
            cell.price.text = String(book.price)
            print("render\(book.name)")
            return cell
        } else {
            print("renderNew")
            let cell = newBookCollectionView.dequeueReusableCell(withReuseIdentifier: newBookIdentifier, for: indexPath) as! BookCollectionViewCell
            let book : Book = books[indexPath.row]
            cell.img.image = book.slug
            cell.name.text = book.name
            cell.price.text = String(book.price)
            print("render\(book.name)")
            return cell
        }
        
        
    }
}
extension HomeScreenViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("size\(books[1].name)")
    return CGSize(width: 150, height: 200)
    }
}
