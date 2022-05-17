//
//  RoundedButton.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-16.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable class RoundedButton : UIButton {
    // MARK: constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)!
        setUp()
    }
    
    private func setUp() {
        self.tintColor = UIColor.white
        self.titleEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
           // Set up button's properties
         self.layer.cornerRadius = self.bounds.size.height/4
       }
   
}
