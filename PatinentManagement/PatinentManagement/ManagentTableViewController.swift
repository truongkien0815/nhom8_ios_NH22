//
//  ManagentTableViewController.swift
//  PatinentManagement
//
//  Created by CNTT on 5/26/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class ManagentTableViewController: UITableViewController {
    
var managents = [Manage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        if let managent = Manage(fullName: "kien", phone: "0815", health: "khoe", date: "11/12", gender: "nam", address: "qb"){
            managents += [managent]
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return managents.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let reuseCell = "ManagentTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath) as? ManagentTableViewCell{
            // Get meal from array of meal (meals) at position of indexPath
            let managent = managents[indexPath.row]
            // set meal into the cell
            cell.lblfullName.text = managent.fullName
            cell.lblDate.text=managent.date
            cell.lblPhone.text = managent.phone
            cell.lblGender.text = managent.gender
            cell.lblHealth.text = managent.health
            cell.lblAddress.text = managent.address
             return cell
           
        }
        else {
            fatalError("Can not create the Cell!")
        }

       
    }
    

    
   
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    
    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unWindFromManagentController(segue:UIStoryboardSegue){
        // print("Back from meal detail")
        
        
        // Get source controller (MealDetailController)
        if let sourceController = segue.source as? ManagentViewController{
            if let managentt = sourceController.managent {
                 print("ten mon an duoc truyen sang la:\(managentt.fullName)")
                
                //Add the new meal into the datasource: meals
                managents += [managentt]
                // Add the new meal into the table view

                
                let indexPath = IndexPath(row: managents.count - 1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
                
            }
        
        }
}
}

