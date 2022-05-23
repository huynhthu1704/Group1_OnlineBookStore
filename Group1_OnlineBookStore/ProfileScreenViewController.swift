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
    var currentUser : User?
    var books = [Book]()
    @IBAction func goToSetting(_ sender: UIBarButtonItem) {
//        let date = "08/19/2020 16:20"
//        var orderedBooks = [OrderedBook]()
//        orderedBooks.append(OrderedBook(orderID: "DH002", book: Book(id: "9", name: "", author: "", publisher: "", price: 1, quantity: 12, totalSold: 12, slug: nil, summary: "", category: ""), amount: 12))
//        let order = Order(id: "DH002", customerName: "Pham Van Thanh", cusAddress: "547, ap 4, Tan Thach, Chau Thanh, Ben Tre", cusPhoneNumber: "0348477517", orderDate: date.toDate() ?? Date(), note: "No note", userId: "2", deliveryFee: 3, books: orderedBooks, state: "To confirm")
//        orderMo.addOrder(order: order)
//                let userInfo = UserInfoViewController(nibName: "UserInfoViewController", bundle: nil)
//                //        self.present(viewAllOrdersController, animated: true, completion: nil)
//                userInfo.navigationItem.title = "User Information"
//                navigationController?.pushViewController(userInfo, animated: true)
        
        dump(SaveData.favoriteModel.books)
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
    var favoriteBooks = [Book]()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var myFavoritesStackView: UIStackView!
    
    //MARK:Properties
    override func viewDidLoad() {
        super.viewDidLoad()

        currentUser = SaveData.userModel.currentUser
        dump(SaveData.favoriteModel.books)
        books = SaveData.bookModel.books
        favoriteBooks = SaveData.favoriteModel.books
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
        
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        self.view.layoutIfNeeded()
        collectionView.reloadData()
//
        userName.text = currentUser?.fullName
        userRank.text = currentUser?.rank
        //        userImage.image = image
        guard let url = URL(string: currentUser!.slug) else { return  }
        let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            DispatchQueue.main.async{
                
                let img = UIImage(data: data)
                self.userImage.image = img
            }
        })
        task.resume()
        
        statisticalStackView.setBackgroundColor(.white)
        myOrdersStackView.setBackgroundColor(.white)
        myFavoritesStackView.setBackgroundColor(.white)
        collectionView.delegate = self
        collectionView.dataSource = self
     
        // register nib file for collection view cell
        collectionView.register(UINib(nibName: "BookItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    //My favorites
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteBooks.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let book = favoriteBooks[indexPath.row]
        SaveData.bookModel.getBookDetail(bookId: book.id)
           let bookDetailViewController = BookDetailViewController(nibName: "BookDetailViewController", bundle: nil)
           bookDetailViewController.modalPresentationStyle = .fullScreen
           present(bookDetailViewController, animated: true, completion: nil)

    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? BookItemCollectionViewCell{
            let book = favoriteBooks[indexPath.row]
            
            if let url = URL(string: book.slug){
                let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
                    guard let data = data, error == nil else{
                        return
                    }
                    
                    DispatchQueue.main.async{
                        
                        let img = UIImage(data: data)
                        cell.img.image = img
                    }
                })
                task.resume()
            }
            //            cell.img.image = book.slug
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
//        NSLayoutConstraint.activate([
//            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
//            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
//        ])
    }
}
extension ProfileScreenViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 40, height: 250)
    }
}
