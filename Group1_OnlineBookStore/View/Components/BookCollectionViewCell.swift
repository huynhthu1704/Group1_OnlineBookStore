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
        view.layer.borderColor = UIColor(red: 0.26, green: 0.36, blue: 0.86, alpha: 1).cgColor
//        view.layer.backgroundColor = UIColor(red: 0.26, green: 0.36, blue: 0.86, alpha: 0.3).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = view.frame.height / 15
        price.textColor = UIColor(red: 0.26, green: 0.36, blue: 0.86, alpha: 1)
//        img.layer.cornerRadius = 2
//        img.layer.masksToBounds = true
        img.layer.cornerRadius = 10
              img.layer.borderWidth = 1
              img.layer.borderColor = UIColor.white.cgColor
              img.layer.masksToBounds = true
}
}
