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
    let book = SaveData.bookModel.book
    @IBOutlet weak var reviewTableView: UITableView!
    
    @IBAction func viewAllReviews(_ sender: Any) {
    }
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var author: UILabel!
    
    @IBOutlet weak var publisher: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var quantity: UILabel!
    
    @IBOutlet weak var viewAllReview: UILabel!
    
    @IBOutlet weak var addToFavorites: UIButton!
    @IBAction func updateQuantity(_ sender: Any) {
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
    }
    
    @IBAction func buyNow(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = NavigationBar(navigationController: self.navigationController)
        nav.setUp()
        addRightBarButtonItem()
        self.tabBarController?.tabBar.isHidden = true
        likeBtn.imageView?.layer.transform = CATransform3DMakeScale(1.8, 1.8, 1.8)
        dump(book)
//        guard let url = URL(string: book!.slug) else { return  }
//               let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
//                   guard let data = data, error == nil else{
//                       return
//                   }
//
//                   DispatchQueue.main.async{
//
//                       let img = UIImage(data: data)
//                       self.img.image = img
//                   }
//               })
//               task.resume()
        self.name.text = book!.name
        self.author.text = book!.author
        self.publisher.text = book!.publisher
        self.price.text = String(book!.price)
        self.quantity.text = String(1)
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
        let cartButton = UIBarButtonItem(customView: cartView)
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
        addSearchBarItem()
    }
    
    public func addSearchBarItem() {
        print("Searchbar")
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: -5, width: 300, height: 20))
        searchBar.placeholder = "Find interesting book"
        searchBar.searchTextField.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar)
        // Set Cart bar button item
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
        cell.username.text = String(review.userID)
        cell.content.text = review.content
        cell.ratingControl.setRatingValue(ratingValue: review.ratingValue)
        return cell
        
    }
    
    
    @IBAction func didLiked(_ sender: UIButton) {
    }
    
    
}
