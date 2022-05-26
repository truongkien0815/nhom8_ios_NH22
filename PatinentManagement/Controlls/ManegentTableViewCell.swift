//
//  ManagentTableViewCell.swift
//  PatinentManagement
//
//  Created by CNTT on 5/26/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class ManegentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblfullName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblHealth: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
