//
//  RoundedTextField.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-19.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable class RoundedTextField : UITextField {
    override init(frame: CGRect) {
          super.init(frame: frame)
          setUp()
      }
      required init(coder: NSCoder) {
          super.init(coder: coder)!
          setUp()
      }
      
      private func setUp() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(red: 0.26, green: 0.36, blue: 0.86, alpha: 1).cgColor
      self.layer.cornerRadius = self.bounds.size.height/4
         }
     
    
}
