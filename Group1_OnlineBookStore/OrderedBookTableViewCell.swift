//
//  OrderedBookTableViewCell.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-19.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class OrderedBookTableViewCell: UITableViewCell {

    @IBOutlet weak var imageBook: UIImageView!
    
    @IBOutlet weak var lblBookNameAuthor: UILabel!
    
    @IBOutlet weak var lblBookPrice: UILabel!
    
    @IBOutlet weak var lblQty: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
