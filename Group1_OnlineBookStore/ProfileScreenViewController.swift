//
//  ProfileScreenViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-15.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class ProfileScreenViewController: UIViewController {
    //MARK: Properties
    //MARK: UI for user's info area
    @IBOutlet weak var userStackView: UIStackView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userRank: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userStackView.setBackgroundColor(.systemTeal)
        let image = UIImage(named: "User's image")
        self.user = User(id: "001", fullName: "Pham Van Thanh", pwd: "12345", birthday: Date(), slug: image, rank: "Gold member")
        if let user = self.user {
            userName.text = user.fullName
            userRank.text = user.rank
            userImage.image = user.slug
        }
    }
    
    
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
