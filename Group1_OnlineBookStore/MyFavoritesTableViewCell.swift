//
//  MyFavoritesTableViewCell.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class MyFavoritesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var bookName: UILabel!
    
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var publisher: UILabel!
    
    @IBOutlet weak var totalSold: UILabel!
    
    @IBOutlet weak var ratingControl: RatingControl!
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
