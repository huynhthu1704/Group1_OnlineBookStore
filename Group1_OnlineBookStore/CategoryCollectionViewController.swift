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
    
@IBOutlet weak var categoryCollectionViewHeight: NSLayoutConstraint!
//    override func viewDidLayoutSubviews() {
//           print("DidLayout")
//           super.viewDidLayoutSubviews()
//           // Set top Sale collection view's height equal to its child cell
//        let flow = self.collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
//           let height = flow.collectionViewContentSize.height
//           categoryCollectionViewHeight.constant = height
//        self.collectionView!.collectionViewLayout = flow
//        self.collectionView.reloadData()
//    }
    override func viewDidLoad(  ) {
        super.viewDidLoad()
        let nav = NavigationBar(navigationController: self.navigationController)
              nav.setUp()
              nav.addSearchBarItem(navigationItem: navigationItem)
              addCartItem()
        // Register cell classes
        self.collectionView!.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.dataSource = self
               self.collectionView!.delegate = self
               self.collectionView!.collectionViewLayout = UICollectionViewFlowLayout()
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
        cell.img.image = category.img
        cell.name.text = category.name
    
        return cell
    }
}
extension CategoryCollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: 220)
    }
}
