//
//  OrderToManagingTableViewCell.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-21.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class OrderToManagingTableViewCell: UITableViewCell {

    @IBOutlet weak var imageForUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserRank: UILabel!
    @IBOutlet weak var btnChangeState: UIButton!
    @IBOutlet weak var lblOrderState: UILabel!
    
    @IBOutlet weak var lblOrderDate: UILabel!
    
    @IBOutlet weak var viewForCell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
