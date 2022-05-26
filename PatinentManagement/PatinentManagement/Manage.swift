//
//  Manage.swift
//  PatinentManagement
//
//  Created by CNTT on 5/26/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit
class Manage {
    var fullName:String
    var phone:String
    var health:String
    var date:String
    var gender:String
    var address:String
    init?(fullName:String,phone:String,
         health:String,date:String,gender:String,address:String) {
        if fullName.isEmpty {
            return nil
        }
        if phone.isEmpty {
            return nil
        }
        if health.isEmpty {
            return nil
        }
        if date.isEmpty {
            return nil
        }
        if gender.isEmpty {
            return nil
        }
        if address.isEmpty {
            return nil
        }
        self.fullName = fullName
        self.phone = phone
        self.health = health
        self.date = date
        self.gender = gender
        self.address = address
        
    }
}
