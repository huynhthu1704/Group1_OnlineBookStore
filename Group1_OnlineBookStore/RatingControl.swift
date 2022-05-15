//
//  RatingControl.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

   @IBInspectable var ratingValue : Int = 2{
            didSet {
                updateButtonState()
            }
        }
        var ratingButtons  = [UIButton]()
        @IBInspectable private var starCount : Int = 5 {
            didSet {
                initialize()
            }
        }
        @IBInspectable private var starSize : CGSize = CGSize(width: 44.0, height: 44.0) {
            didSet {
                
                initialize()
            }
        }
        // MARK: constructor
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            initialize()
        }
        required init(coder: NSCoder) {
            super.init(coder: coder)
            initialize()
        }
        private func setSize(button : UIButton, size : CGSize) {
            // Set up button's properties
            button.tintColor = UIColor.black
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            
        }
        
        // Initalization of Rating control
        private func initialize() {
            // Clear the old button
            for button in ratingButtons {
                removeArrangedSubview(button)
                button.removeFromSuperview()
            }
            ratingButtons.removeAll()
            
            // Load the star image to code
            let normalStar = UIImage(systemName: "star")
            let highlightedStar =  UIImage(systemName: "star")
            let ratingStar = UIImage(systemName: "star.fill")
            for _ in 1...starCount {
                // Create button
                let btnRating = UIButton()
                // Set up button's properties
              
                
                // Set star image for the button
                btnRating.setImage(normalStar, for: .normal)
                btnRating.setImage(highlightedStar, for: .highlighted)
                btnRating.setImage(ratingStar, for: .selected)
                btnRating.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
                btnRating.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
                btnRating.tintColor = UIColor.yellow
                // Event processing for btnRating
                btnRating.addTarget(self, action: #selector(btnRatingPressed(button:)), for: .touchUpInside)
                // Add the btnRating button to stackview
                addArrangedSubview(btnRating)
                // add the rating button to array
                ratingButtons.append(btnRating)
            }
            updateButtonState()
        }
        // MARK: Rating button pressed
        @objc private func btnRatingPressed(button : UIButton) {
            if let index = ratingButtons.firstIndex(of: button) {
                if index + 1 == ratingValue{
                    ratingValue -= 1
                    
                }else {
                    ratingValue = index + 1
                }
            }
            updateButtonState()
        }
        private func updateButtonState() {
            for (index, button) in ratingButtons.enumerated() {
                button.isSelected = index < ratingValue
            }
        }
        //MARK: Getter and setter for rating value
        func getRatingValue() -> Int{
            return self.ratingValue
        }
        
        func setRatingValue(ratingValue : Int){
            self.ratingValue = ratingValue
        }
    }
