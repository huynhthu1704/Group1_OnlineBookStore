//
//  BookYCollectionViewCell.swift
//  Group1_OnlineBookStore
//
//  Created by VoYen on 2022-05-23.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class BookYCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
  
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
