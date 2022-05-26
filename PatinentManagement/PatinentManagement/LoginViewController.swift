//
//  LoginViewController.swift
//  PatinentManagement
//
//  Created by CNTT on 5/26/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
txtUserName.delegate = self
        txtPass.delegate=self
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("ten ban la " )
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtPass.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
