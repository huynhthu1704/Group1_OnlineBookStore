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
              nav.addCartItem(navigationItem: navigationItem)
        // Register cell classes
        self.collectionView!.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.dataSource = self
               self.collectionView!.delegate = self
               self.collectionView!.collectionViewLayout = UICollectionViewFlowLayout()
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

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
extension CategoryCollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: 220)
    }
}
