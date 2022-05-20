//
//  ViewController.swift
//  FoodManagement2012
//
//  Created by CNTT on 4/8/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit
//UIImagePickerControllerDelegate co che uy quyen B1
class MealDetailController: UIViewController,  UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: Properties
    //IB:interface builder

    @IBOutlet weak var btnGoToMAp: UIButton!
    @IBOutlet weak var editMEalName: UITextField!
    @IBOutlet weak var imgMeal: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var btnSave: UIBarButtonItem!
    
    //Variable to pass to mealListController
    var meal:Meal?
    
    enum NavigationType {
        case newMeal
        case editMeal
    }
    
    var navigationType:NavigationType = .newMeal
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Setup for the button corner: bo goc button
        btnGoToMAp.clipsToBounds = true
        btnGoToMAp.layer.cornerRadius = 10
        //Delegation of textfield
        editMEalName.delegate = self
        //get edit meal from mealtableviewcontroller
        if let meal = meal {
            navigationItem.title = meal.mealName
            editMEalName.text = meal.mealName
            imgMeal.image = meal.mealImage
            ratingControl.setRatingValue(ratingValue: meal.ratingValue)
        }
        
    }

    //MARK: TextField 's Delegation Functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //An ban phim
        editMEalName.resignFirstResponder()
        return true
        
    }
    func textFieldDidEndEditing(_ textField: UITextField){
        //print("Ten cua mon an moi nhap la: \(editMEalName.text!)")
        navigationItem.title = editMEalName.text!
    }

    //MARK: Image processing
    @IBAction func imageProcessing(_ sender: UITapGestureRecognizer) {
        //An ban phim
        editMEalName.resignFirstResponder()
        //tao doi tuong
        let imagePickerController = UIImagePickerController();
        //setup the properties for the imagePicker object
        imagePickerController.sourceType = .photoLibrary
        //present chuyen man hinh
        
        //delegation of image picjer controller
        imagePickerController.delegate = self
        //pass to the imagePicker controller Screen
        present(imagePickerController, animated: true, completion: nil)
        //co che uy quyen
    }
    //MARK: image picker controller's Delegation Function //co che uy quyen B2
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //hide the imaege picker controller and return the previous screen
        dismiss(animated: true, completion: nil)
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imgMeal.image = selectedImage
        }
        //hide the image picker controller
        dismiss(animated: true, completion: nil)
        
    }
    
    //Mark: navigation Action
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        //indentifying cancel new meal or cancel update meal
        switch  navigationType {
        case .newMeal:
             dismiss(animated: true, completion: nil)
        case .editMeal:
            //get the navigation controller
            if let navigationController = navigationController {
                navigationController.popViewController(animated: true)
            }
        }
       
    }
    //chuyen man hinh
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print("prepare")
        //check if the sender is btnSave or not
        
        if let btnSender = sender as? UIBarButtonItem {
            if btnSave === btnSender {
                //print("Dung la butoon Save")
                let name = editMEalName.text ?? ""
                let image = imgMeal.image
                let ratingValue = ratingControl.getRatingValue()
                //create the new meal
                meal = Meal(mealName: name, ratingValue: ratingValue, mealImage: image)
            }
            
        }
        if let btnSender = sender as? UIButton {
            if btnGoToMAp === btnSender {
                print("Dung la butoon Go To Map")
            }
            
        }
        
    }
    //truyen tham so
    //sharepreferences
    // co che unWind
}

