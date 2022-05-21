//
//  AdminCategoryViewController.swift
//  Group1_OnlineBookStore
//
//  Created by VoYen on 2022-05-21.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class AdminCategoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var categories = [Category]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
let category = Category(id: "1", name: "Category", img: UIImage(named: "Image-"))
        for _ in 1...7{
            categories.append(category)
            
        }
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIViewController:UITableViewDelegate,UITableViewDataSource{
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "CategoryTableViewCell"
        var cell:CategoryTableViewCell! = tableView.dequeueReusableCell(withIdentifier: indentifier) as? CategoryTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: indentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: indentifier) as? CategoryTableViewCell
        }
        let category = categories[indexPath.row]
        cell.img.image = UIImage(named:"Image- \(indexPath.row+2)")
        cell.lblName.text = category.name
//        let cell = (tableView.dequeueReusableCell(withIdentifier:"CategoryTableViewCell") as? CategoryTableViewCell)!
//        cell.img.image = UIImage(named: String("Image-\(indexPath.row + 1)")
//            cell.lblName.text =
//
//        return cell
        return cell
        
    }
    
    
}
