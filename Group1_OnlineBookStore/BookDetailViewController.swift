//
//  BookDetailViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-16.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController, UITableViewDataSource {

    //MARK:  Properties
    @IBOutlet weak var likeBtn: UIButton!
    var reviews = [Review]()
    var books = [Book]()
    @IBOutlet weak var reviewTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBar = self.navigationController?.navigationBar
        // Hide nav's shadow
        navigationBar?.setValue(true, forKey: "hidesShadow")
        navigationBar?.tintColor = UIColor.white
        // Change nav's color
        navigationBar?.barTintColor = UIColor(red: 0.26, green: 0.36, blue: 0.86, alpha: 1)
        navigationBar?.titleTextAttributes = [.foregroundColor : UIColor.white]
        navigationBar?.isTranslucent = false
        
        
        // Set Cart bar button item
        let cartBtn = UIButton(type: .custom)
        let cartBtnImage = UIImage(systemName: "cart")
        cartBtn.setBackgroundImage(cartBtnImage, for: .normal)
        cartBtn.addTarget(self, action: #selector(goToShoppingCart), for: .touchUpInside)
        cartBtn.frame = CGRect(x:0, y: 0, width: 35, height: 35)
        
        let cartView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        cartView.addSubview(cartBtn)
        let cartButton = UIBarButtonItem(customView: cartView)
        navigationItem.rightBarButtonItem = cartButton
        
        // Set Search bar button item
        let searchBtn = UIButton(type: .custom)
        let backBtnImage1 = UIImage(systemName: "magnifyingglass")
        searchBtn.setBackgroundImage(backBtnImage1, for: .normal)
        searchBtn.addTarget(self, action: #selector(goToShoppingCart), for: .touchUpInside)
        searchBtn.frame = CGRect(x:0, y:0, width: 35, height: 35)
        let searchView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        searchView.addSubview(searchBtn)
        let searchButton = UIBarButtonItem(customView: searchView)
        navigationItem.rightBarButtonItems?.append(cartButton)
        navigationItem.rightBarButtonItems?.append(searchButton)
        
        
        
        
        likeBtn.imageView?.layer.transform = CATransform3DMakeScale(1.8, 1.8, 1.8)
        let book = Book(id: "1", name: "Xu xu dung khoc", author: "Hong Sakura", publisher: "Hoi nha van", price: 120000, quantity: 1, totalSold: 0, slug: UIImage(named: "XuXu")!, summary: "This is a good book, it's really interesting", category: "Fairy tale")
        navigationController?.title = book.name
    }
    @objc func goToShoppingCart() {
        let shoppingCartVC = ShoppingCartViewController(nibName: "ShoppingCartViewController", bundle: nil)
        self.navigationController?.pushViewController(shoppingCartVC, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIndentifier = "cell"
        var cell: ReviewTableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? ReviewTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? ReviewTableViewCell
        }
        let review = reviews[indexPath.row]
        cell.username.text = review.userID
        cell.content.text = review.content
        cell.ratingControl.setRatingValue(ratingValue: review.ratingValue)
        return cell
        
    }
    
    
    @IBAction func didLiked(_ sender: UIButton) {
    }
    
    
}
