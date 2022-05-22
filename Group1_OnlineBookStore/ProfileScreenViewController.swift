//
//  ProfileScreenViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-15.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

class ProfileScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: Properties
    
    
    let identifier = "BookCollectionViewCell"
    var userModel = UserModel()
    
    @IBAction func goToSetting(_ sender: UIBarButtonItem) {
        dump(userModel.users)
        
        //        let userInfo = UserInfoViewController(nibName: "UserInfoViewController", bundle: nil)
        //        //        self.present(viewAllOrdersController, animated: true, completion: nil)
        //        userInfo.navigationItem.title = "User Information"
        //        navigationController?.pushViewController(userInfo, animated: true)
    }
    //MARK: UI for user's info area
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userRank: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userView: UIView!
    //MARK: UI for statistical area
    @IBOutlet weak var statisticalStackView: UIStackView!
    
    //MARK: UI for My orders area
    @IBOutlet weak var myOrdersStackView: UIStackView!
    var user:User?
    
    //MARK: Collection my favorite
    var books = [Book]()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var myFavoritesStackView: UIStackView!
    
    //MARK:Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        userModel.getAllData()
        // Set text color for username and rank
        userName.textColor = UIColor.white
        userRank.textColor = UIColor.white
        
        // Make rounded iamge
        userImage.layer.cornerRadius = userImage.layer.frame.height/2
        userImage.layer.borderWidth = 1
        userImage.layer.borderColor = UIColor.white.cgColor
        userImage.layer.masksToBounds = true
        
        // Set attributes for navigation
        let navigationBar = self.navigationController?.navigationBar
        
        // Hide nav's shadow
        navigationBar?.setValue(true, forKey: "hidesShadow")
        
        // Change nav's color
        navigationBar?.barTintColor = UIColor(red: 0.26, green: 0.36, blue: 0.86, alpha: 1)
        navigationBar?.titleTextAttributes = [.foregroundColor : UIColor.white]
        navigationBar?.isTranslucent = false
        
        // Customer user's section background color
        userView.backgroundColor = UIColor(red: 0.26, green: 0.36, blue: 0.86, alpha: 1)
        
        let imageUser = UIImage(named: "User's image")
        self.user = User(id: 1, fullName: "Ngoc Thu", pwd: "12345", phoneNumber: "1223343", slug: "https://firebasestorage.googleapis.com/v0/b/onlinebookstore-79227.appspot.com/o/users%2FWIN_20211231_18_15_36_Pro%20(2).jpg?alt=media&token=38c3a93e-18e8-45d0-9af4-684ceed47466", rank: "Gold member", role_id: 2)
        if let user = self.user {
            userName.text = user.fullName
            userRank.text = user.rank
            guard let url = URL(string: user.slug) else { return  }
            let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
                guard let data = data, error == nil else{
                    self.userImage.image = imageUser
                    return
                }
                
                DispatchQueue.main.async{
                    
                    let img = UIImage(data: data)
                    self.userImage.image = img
                }
            })
            task.resume()
            
        }
        
        statisticalStackView.setBackgroundColor(.white)
        myOrdersStackView.setBackgroundColor(.white)
        myFavoritesStackView.setBackgroundColor(.white)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let book = Book(id: "1", name: "Xu Xu dung khoc", author: "Hong Sakura", publisher: "Hoi nha van", price: 120000, quantity: 15, totalSold: 14, slug: UIImage(named: "XuXu"), summary: "x", category: "x")
        for _ in 1...6 {
            books.append(book);
        }
        // register nib file for collection view cell
        collectionView.register(UINib(nibName: "BookItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    //My favorites
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? BookItemCollectionViewCell{
            let book = books[indexPath.row]
            cell.img.image = book.slug
            cell.name.text = book.name
            cell.price.text = String(book.price)
            return cell
        }else{
            fatalError("Can not create the cell")
        }
    }
    
    //MARK: Button
    
    
    @IBAction func goToViewAllOrders(_ sender: UIButton) {
        let viewAllOrdersController = MyOrdersViewController(nibName: "MyOrdersViewController", bundle: nil)
        //        self.present(viewAllOrdersController, animated: true, completion: nil)
        viewAllOrdersController.navigationItem.title = "My orders"
        navigationController?.pushViewController(viewAllOrdersController, animated: true)
    }
    
    @IBAction func goToViewAllFavorites(_ sender: UIButton) {
        let viewAllFavorites = MyFavoritesViewController(nibName: "MyFavoritesViewController", bundle: nil)
        //        self.present(viewAllOrdersController, animated: true, completion: nil)
        viewAllFavorites.navigationItem.title = "My favorites"
        navigationController?.pushViewController(viewAllFavorites, animated: true)
    }
    
    @IBAction func goToMyReviewsScreen(_ sender: UITapGestureRecognizer) {
        let myReviewsScreen = MyReviewsViewController(nibName: "MyReviewsViewController", bundle: nil)
        //        self.present(viewAllOrdersController, animated: true, completion: nil)
        myReviewsScreen.navigationItem.title = "My reviews"
        navigationController?.pushViewController(myReviewsScreen, animated: true)
    }
    
    @IBAction func goToToReivewScreen(_ sender: UITapGestureRecognizer) {
        let toReivewScreen = ToReviewsViewController(nibName: "ToReviewsViewController", bundle: nil)
        //        self.present(viewAllOrdersController, animated: true, completion: nil)
        toReivewScreen.navigationItem.title = "To Review Books"
        navigationController?.pushViewController(toReivewScreen, animated: true)
    }
    
    //    override func viewDidLayoutSubviews() {
    //        super.viewDidLayoutSubviews()
    //        collectionView.frame = view.bounds
    //     }
    
    //    @IBAction func btn(_ sender: UIButton) {
    //
    //        let viewAllOrdersController = MyOrdersViewController(nibName: "MyOrdersViewController", bundle: nil)
    //        //        self.present(viewAllOrdersController, animated: true, completion: nil)
    //        viewAllOrdersController.navigationItem.title = "My orders"
    //        navigationController?.pushViewController(viewAllOrdersController, animated: true)
    //    }
    
    
}
extension UIStackView {
    func setBackgroundColor(_ color: UIColor) {
        let backgroundView = UIView(frame: .zero)
        backgroundView.backgroundColor = color
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(backgroundView, at: 0)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
