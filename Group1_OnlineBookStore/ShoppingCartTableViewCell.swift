//
//  ShoppingCartTableViewCell.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-16.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class ShoppingCartTableViewCell: UITableViewCell {

    // Properties
    @IBOutlet weak var selectBtn: CheckBox!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookImg: UIImageView!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
