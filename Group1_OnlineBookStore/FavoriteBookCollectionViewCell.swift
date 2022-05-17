//
//  FavoriteBookCollectionViewCell.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-16.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class FavoriteBookCollectionViewCell: UICollectionViewCell {
//    static let identifier = "FavoriteBookViewCell"
    @IBOutlet weak var bookImag: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
