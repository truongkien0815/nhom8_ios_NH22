//
//  ManagentViewController.swift
//  PatinentManagement
//
//  Created by CNTT on 5/26/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class ManagentViewController: UIViewController,UITextFieldDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var btnCancel: UIBarButtonItem!
    @IBOutlet weak var btnSave: UIBarButtonItem!
    @IBOutlet weak var txtHealth: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    var managent:Manage?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFullName.delegate = self
        txtPhone.delegate = self
        txtHealth.delegate=self
        txtDate.delegate=self
        txtGender.delegate = self
        txtAddress.delegate=self
        
        
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtFullName.resignFirstResponder()
        txtPhone.resignFirstResponder()
        txtHealth.resignFirstResponder()
        txtDate.resignFirstResponder()
        txtGender.resignFirstResponder()
        txtAddress.resignFirstResponder()
        
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print( "Hello \(txtFullName.text!)")
    }
    
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let btnSender = sender as? UIBarButtonItem{
            if btnSave === btnSender {
        let name = txtFullName.text ?? ""
        let phone = txtPhone.text ?? ""
        let address = txtAddress.text ?? ""
        let date = txtDate.text ?? ""
        let health = txtHealth.text ?? ""
        let gender = txtGender.text ?? ""
        // Create the new meal
        managent = Manage(fullName: name, phone: phone, health: health, date: date, gender: gender, address: address)
        }
            
            if btnCancel === btnSender {
                print("cancel")
            }
        }
        
    }
}
