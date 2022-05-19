//
//  BookItemCollectionViewCell.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-19.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class BookItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.borderColor = UIColor(red: 0.26, green: 0.36, blue: 0.86, alpha: 1).cgColor
        // Initialization code
    }

}
