//
//  CategoryViewController.swift
//  Group1_OnlineBookStore
//
//  Created by VoYen on 2022-05-23.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as? CategoryTableViewCell)!
                let category = categories[indexPath.row]
        //        cell.img = category.img
                cell.lblName.text = category.name
                return cell
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
           cartButton = UIBarButtonItem(customView: cartView)
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
        if isSearchBarShown {
            navigationItem.leftBarButtonItem = nil
            print("result")
        } else {
            addSearchBarItem()
        }
        isSearchBarShown = !isSearchBarShown
    }
    
    public func addSearchBarItem() {
        print("Searchbar")
        
        self.searchBar.placeholder = "Find interesting book"
        self.searchBar.searchTextField.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.searchBar)
        //        searchBar.isHidden = !isSearchBarShown
    }
    let searchBar = UISearchBar(frame: CGRect(x: 0, y: -5, width: 300, height: 20))
    var isSearchBarShown = false
    var cartButton = UIBarButtonItem()
    var categoryModel = CategoryModel()
       var categories = [Category]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = SaveData.categoryModel.categories
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        let nav = NavigationBar(navigationController: self.navigationController)
                nav.setUp()
        //        nav.addSearchBarItem(navigationItem: navigationItem)
                addRightBarButtonItem()
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
