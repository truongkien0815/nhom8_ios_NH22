//
//  MealTableViewController.swift
//  FoodManagement2012
//
//  Created by CNTT on 4/22/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    //Mark: Properties
    //mang khong co phan tu
    var meals = [Meal]()
    
    enum NavigationType {
        case newMeal
        case editMeal
    }
    
    var navigationType:NavigationType = .newMeal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //create exam of meals for testing table view
        let mealImage = UIImage(named: "Image")
        if let meal = Meal(mealName: "Ca Chien Xu", ratingValue: 2, mealImage: mealImage){
            //noi mang
            meals += [meal]
        }
        
        //add the edit menu into the navigation bar
        navigationItem.leftBarButtonItem = editButtonItem

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = "MealTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath) as? MealTableViewCell {
            //Get meal from array of meal (meals) up position of indexPath
            let meal = meals [indexPath.row]
            //set meal into the cell
            cell.lblMealName.text = meal.mealName
            cell.imgMeal.image = meal.mealImage
            cell.ratingControl.setRatingValue(ratingValue: meal.ratingValue)
            return cell
        }
        else {
            fatalError("Cannot create the cell")
        }

         //Configure the cell...

        
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //dealete from data source
            meals.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //Indentifying edit meal or new meal
        if let segueName = segue.identifier {
            switch segueName {
            case "newMeal":
                //print("newMeal")
                navigationType = .newMeal
                if let destisnationController = segue.destination as? MealDetailController {
                    destisnationController.navigationType = .newMeal
                }
            case "editMeal":
                //print("editMeal")
                //get the selected meal
                navigationType = .editMeal
                if let selectedIndexPathRow = tableView.indexPathForSelectedRow {
                    //get the selected meal from data source
                    let meal = meals[selectedIndexPathRow.row]
                    if let destisnationController = segue.destination as? MealDetailController {
                        destisnationController.meal = meal
                        destisnationController.navigationType = .editMeal
                    }
                }
            default:
                break
            }
        }
    }
    
    //create unWind to return from MealDetailController
    @IBAction func unWindFromMealDetailCotroller(segue:UIStoryboardSegue) {
        //print("Back")
        //get source controller (mealdetailcontroller)
        if let sourceController = segue.source as? MealDetailController {
            if let meal = sourceController.meal {
                //print("Ten mon an duoc chuyen sang: \(meal.mealName)")
                //indentifying update or add new meal
                switch navigationType {
                case .newMeal:
                    //add the new meal into the datasource: meals
                    meals += [meal]
                    //add the new meal into the table view
                    let indexPath = IndexPath(row: meals.count - 1, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                case .editMeal:
                    //get the position of selected row
                    if let selectedIndexPath = tableView.indexPathForSelectedRow {
                        //update to data source
                        meals[selectedIndexPath.row] = meal
                        //reload the update meal to table view
                        tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
                    }
                }
               
            }
        }
        
    }

}
