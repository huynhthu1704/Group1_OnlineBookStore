//
//  BookCollectionViewCell.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-20.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

@IBDesignable class BookCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       let frame = name.frame //Frame of label

        // Bottom Layer
        let topLayer = CALayer()
        topLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: 2)
        topLayer.backgroundColor = UIColor.lightGray.cgColor
        name.layer.addSublayer(topLayer)
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 2
        price.textColor = UIColor(red: 0.26, green: 0.36, blue: 0.86, alpha: 1)
}
}
