//
//  OrderManagementViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-21.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class OrderManagementViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var orderToManagingTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        orderToManagingTableView.dataSource = self
        orderToManagingTableView.delegate = self
    }
                  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIndentifier = "OrderToManagingTableViewCell"
        var cell: OrderToManagingTableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? OrderToManagingTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "OrderToManagingTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? OrderToManagingTableViewCell
        }
        //cell.imageForUser.image =
        cell.lblUserName.text = "Steve Job"
        cell.lblUserRank.text = "Gold member"
        cell.lblOrderDate.text = Date().getFormater(format: "MM/dd/yyyy HH:mm")
        cell.lblOrderState.text = "To confirm"
        cell.viewForCell.layer.borderWidth = 1.5
        cell.viewForCell.layer.borderColor = UIColor.black.cgColor
        cell.viewForCell.layer.cornerRadius = 15
        cell.btnChangeState.setTitle("Change state to To receive", for: .normal)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let orderDetailView = OrderDetailViewController(nibName: "OrderDetailViewController", bundle: nil)
                //        self.present(viewAllOrdersController, animated: true, completion: nil)
        orderDetailView.orderID = "OD15"
        orderDetailView.hidden = true
                orderDetailView.navigationItem.title = "Order detail"
                navigationController?.pushViewController(orderDetailView, animated: true)
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
