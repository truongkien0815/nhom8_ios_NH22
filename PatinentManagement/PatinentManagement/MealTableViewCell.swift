//
//  MealTableViewCell.swift
//  FoodManagement2012
//
//  Created by CNTT on 4/29/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgMeal: UIImageView!
    @IBOutlet weak var lblMealName: UILabel!
    @IBOutlet weak var ratingControl: RatingControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
