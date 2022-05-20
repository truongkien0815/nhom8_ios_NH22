//
//  Meal.swift
//  FoodManagement2012
//
//  Created by CNTT on 4/29/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import Foundation
import UIKit
class Meal {
    
    var mealName: String
    var ratingValue: Int
    var mealImage: UIImage?
    
    //Constructor
    init?(mealName: String, ratingValue: Int, mealImage: UIImage?) {
        if mealName.isEmpty {
            return nil
        }
        if ratingValue < 0 || ratingValue > 5 {
            return nil
        }
        self.mealName = mealName
        self.ratingValue = ratingValue
        self.mealImage = mealImage
    }
}
