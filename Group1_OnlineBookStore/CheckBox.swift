//
//  CheckBox.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-16.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import UIKit
class CheckBox: UIButton {
// Images
let checkedImage = UIImage(systemName:  "checkmark.rectangle")! as UIImage
let uncheckedImage = UIImage(systemName: "checkmark.rectangle.fill")! as UIImage

// Bool property
var isChecked: Bool = false {
    didSet {
        if isChecked == true {
            self.setImage(checkedImage, for: UIControl.State.normal)
        } else {
            self.setImage(uncheckedImage, for: UIControl.State.normal)
        }
    }
}
  override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
        
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
