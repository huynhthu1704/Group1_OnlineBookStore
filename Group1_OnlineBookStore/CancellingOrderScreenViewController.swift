//
//  CancellingOrderScreenViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-20.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit
import DropDown
class CancellingOrderScreenViewController: UIViewController {

    @IBOutlet weak var viewDropDown: UIView!
    @IBOutlet weak var lblReason: UILabel!
    
    let dropDown = DropDown()
    var defaulValueForDropDown = ""
    let dropDownValues = ["Delivery time to long/soon", "Change order address", "Change payment method", "Order dulicate", "Add/remove books", "Orther"]
    override func viewDidLoad() {
        super.viewDidLoad()
        defaulValueForDropDown = lblReason.text ?? ""
        
        dropDown.anchorView = viewDropDown
        dropDown.dataSource = dropDownValues
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
        
        dropDown.selectionAction = {
            (index: Int, item: String) in
            self.lblReason.text = self.dropDownValues[index]
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func dropDownShow(_ sender: UITapGestureRecognizer) {
        dropDown.show()
    }
    
    @IBAction func cancelOrder(_ sender: UIButton) {
        //If not select reason do not cancel order
        if let lblReason = lblReason.text {
            if lblReason == defaulValueForDropDown {
                let alert = UIAlertController(title: "ERROR", message: "You have not chosen reason for cancelling!", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }else{
                //Cancel order
                //Switch to MyOrdersScreen
                navigationController?.popViewController(animated: true)
            }
        }
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
