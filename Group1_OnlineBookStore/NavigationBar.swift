//
//  NavigationBar.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-20.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import UIKit

class NavigationBar {
    init() {
        
    }
   public func setUp(navigationBar : UINavigationBar?) {
        navigationBar!.setValue(true, forKey: "hidesShadow")
             navigationBar!.tintColor = UIColor.white
             // Change nav's color
             navigationBar!.barTintColor = UIColor(red: 0.26, green: 0.36, blue: 0.86, alpha: 1)
             navigationBar!.titleTextAttributes = [.foregroundColor : UIColor.white]
             navigationBar!.isTranslucent = false

    }
}
     
