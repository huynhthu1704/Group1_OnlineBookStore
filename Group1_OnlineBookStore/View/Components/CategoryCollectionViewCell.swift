//
//  CategoryCollectionViewCell.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-20.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.borderWidth = 2
        img.layer.cornerRadius = 10
        img.layer.masksToBounds = true
    }

}
