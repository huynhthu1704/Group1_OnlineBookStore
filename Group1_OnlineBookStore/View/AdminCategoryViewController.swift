//
//  AdminCategoryViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-22.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
class AdminCategoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as? CategoryTableViewCell)!
        let category = categories[indexPath.row]
//        cell.img = category.img
        cell.lblName.text = category.name
        return cell
    
    }
    var categoryModel = CategoryModel()
    var categories = [Category]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = SaveData.categoryModel.categories
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        
//let category = Category(id: "123", name: "Ke tam xuong", img: UIImage(named: "XuXu"))
//        // Do any additional setup after loading the view.
//        for _ in 1...8{
//            categories.append(category)
//        }
    }

    @IBAction func goToAll(_ sender: Any) {
        let toReivewScreen = SeemoreViewController(nibName: "SeemoreViewController", bundle: nil)
               
               
               navigationController?.pushViewController(toReivewScreen, animated: true)
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

