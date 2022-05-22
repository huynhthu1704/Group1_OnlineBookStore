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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Set top Sale collection view's height equal to its child cell
        let flow = topSaleCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let heightTopSale = flow.collectionViewContentSize.height
        topSaleCollectionViewHeight.constant = heightTopSale
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 10
        topSaleCollectionView.collectionViewLayout = flow
        self.view.layoutIfNeeded()
        topSaleCollectionView.reloadData()
        
        // Set new book collection view's height equal to its child cell
        let flow2 = newBookCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let heightNewBook = flow.collectionViewContentSize.height
        newBookCollectionViewHeight.constant = heightNewBook
        flow2.minimumInteritemSpacing = 0
        flow2.minimumLineSpacing = 10
        newBookCollectionView.collectionViewLayout = flow2
        self.view.layoutIfNeeded()
        newBookCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Customer navigation bar
        let nav = NavigationBar(navigationController: self.navigationController)
        nav.setUp()
        nav.addSearchBarItem(navigationItem: navigationItem)
        addCartItem()
        
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
        let userModel = UserModel()
        let user = User(id: 1, fullName: "Pham Van Ngoc Thu", pwd: "robertthanh", phoneNumber: "0123445567", slug: "", rank: "Member", role_id: 2)
//        userModel.getAllData()
//        let users : [User] = userModel.users
//        print("count\(users.count)")
//        for i in 0..<users.count {
//            print(users[i].id)
//            print(users[i].fullName)
        userModel.updateUser(user: user)
        
    }
    
    @objc func goToShoppingCart(_ sender: UIBarButtonItem) {
        print("Go to")
        let vc = BookListViewController(nibName: "BookListViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    public func addCartItem() {
        // Set Cart bar button item
        let cartBtn = UIButton(type: .custom)
        let cartBtnImage = UIImage(systemName: "cart")
        cartBtn.setBackgroundImage(cartBtnImage, for: .normal)
        cartBtn.addTarget(self, action: #selector(goToShoppingCart), for: .touchUpInside)
        cartBtn.frame = CGRect(x:0, y: 0, width: 35, height: 35)
        let cartView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        cartView.addSubview(cartBtn)
        let cartButton = UIBarButtonItem(customView: cartView)
        self.navigationItem.rightBarButtonItem = cartButton
    }
}

extension HomeScreenViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topSaleCollectionView {
            let cell = topSaleCollectionView.dequeueReusableCell(withReuseIdentifier: topSaleBookIdentifier, for: indexPath) as! BookCollectionViewCell
            let book : Book = books[indexPath.row]
            cell.img.image = book.slug
            cell.name.text = book.name
            cell.price.text = String(book.price)
            return cell
        } else {
            let cell = newBookCollectionView.dequeueReusableCell(withReuseIdentifier: newBookIdentifier, for: indexPath) as! BookCollectionViewCell
            let book : Book = books[indexPath.row]
            cell.img.image = book.slug
            cell.name.text = book.name
            cell.price.text = String(book.price)
            return cell
        }
    }
}

extension HomeScreenViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: 250)
    }
}
extension UINavigationBar {
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 80)
    }
}
