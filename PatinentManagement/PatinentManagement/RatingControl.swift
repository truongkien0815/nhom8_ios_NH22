//
//  RatingControl.swift
//  FoodManagement2012
//
//  Created by CNTT on 4/15/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK: Properties
    @IBInspectable private var ratingValue:Int = 1 {
        didSet {
            updateButtonState()
       
        }
    }
    private var ratingButtons = [UIButton]()
    @IBInspectable private var starCount:Int = 5 {
        didSet{
            initialization()
        }
    }
    @IBInspectable private var starSize:CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            initialization()
        }
    }
    
    //MARK: Constructors
    //constructor
    //ten trung ten lop
    //khong co gia tri tra ve
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        initialization()
    }
    //MARK: initialization of rating control
    private func initialization() {
        //clear the old rating buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        //load the star image
        let bundle = Bundle(for: type(of: self))
        let normalStar = UIImage(named: "normalStar", in: bundle, compatibleWith: self.traitCollection)
        let selectedStar = UIImage(named: "selectedStar", in: bundle, compatibleWith: self.traitCollection )
        let pressedStar = UIImage(named: "pressedStar", in: bundle, compatibleWith: self.traitCollection)
        //creation of rating buttons
        for _ in 0..<starCount {
            let btnRating = UIButton()
            //setup properties for the rating buttons
            //btnRating.backgroundColor = UIColor.orange
            //set stars images
            btnRating.setImage(normalStar, for: .normal)
            btnRating.setImage(selectedStar, for: .selected)
            btnRating.setImage(pressedStar, for: .highlighted)
            
            btnRating.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            btnRating.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            //event processing
            btnRating.addTarget(self, action: #selector(ratingButtonPressed(button:)), for: .touchUpInside)
            //add the ceated button to the StackView
            //add co thu tu
            addArrangedSubview(btnRating)
            //add the button to array of button
            //ratingButtons += [btnRating] Cach1
            //UI:user interface
            //CG:core graphic
            ratingButtons.append(btnRating)
        }
        updateButtonState()
    }
    //MARK: ratingbutton's ation
    @objc private func ratingButtonPressed(button: UIButton) {
        //print("Called")
        if let index = ratingButtons.firstIndex(of: button){
            if index + 1 == ratingValue {
                ratingValue -= 1
            }
            else{
                ratingValue = index + 1
            }
        }
        //update buttonState
        updateButtonState()
        //print("Vi tri cua button trong mang la: \(index!)")
    }
    
    private func updateButtonState() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < ratingValue
//            if index < ratingValue {
//                button.isSelected = true
//            }
//            else {
//                button.isSelected = false
//            }
        }
    }
    
    //Mark: getter and setter for ratingValue
    func getRatingValue() -> Int {
        return ratingValue
    }
    
    func setRatingValue(ratingValue: Int) {
        self.ratingValue = ratingValue
    }
}
