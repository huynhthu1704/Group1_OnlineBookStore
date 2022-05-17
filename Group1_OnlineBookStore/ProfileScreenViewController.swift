//
//  ProfileScreenViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-15.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class ProfileScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: Properties
    //MARK: UI for user's info area
    @IBOutlet weak var userStackView: UIStackView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userRank: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    //MARK: UI for statistical area
    @IBOutlet weak var statisticalStackView: UIStackView!
    
    //MARK: UI for My orders area
    @IBOutlet weak var myOrdersStackView: UIStackView!
    var user:User?
    
    //MARK: Collection my favorite
    var books = [Book]()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var myFavoritesStackView: UIStackView!
    
    //    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    //MARK:Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userStackView.setBackgroundColor(.systemTeal)
        let imageUser = UIImage(named: "User's image")
        self.user = User(id: "001", fullName: "Pham Van Thanh", pwd: "12345", birthday: Date(), slug: imageUser, rank: "Gold member")
        if let user = self.user {
            userName.text = user.fullName
            userRank.text = user.rank
            userImage.image = user.slug
        }
        
        statisticalStackView.setBackgroundColor(.white)
        myOrdersStackView.setBackgroundColor(.white)
        myFavoritesStackView.setBackgroundColor(.white)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let book = Book(id: "1", name: "Xu Xu dung khoc", author: "x", price: 11, quantity: 15, totalSold: 14, slug: UIImage(named: "XuXu"), summary: "x", category: "x")
        for _ in 0...8 {
            books.append(book);
        }
    }
    //My favorites
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteBookViewCell", for: indexPath) as? FavoriteBookCollectionViewCell{
            let book = books[indexPath.row]
            cell.bookImag.image = book.slug
            cell.bookName.text = book.name
            return cell
        }else{
            fatalError("Can not create the cell")
        }
    }
    
    //MARK: Button
    
    @IBAction func goToSettingAccount(_ sender: UIButton) {
    }
    
    @IBAction func goToViewAllOrders(_ sender: UIButton) {
    }
    
    @IBAction func goToViewAllFavorites(_ sender: UIButton) {
    }
    
    @IBAction func goToMyReviewsScreen(_ sender: UITapGestureRecognizer) {
        print("Go to My reviews screen")
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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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
