//
//  ChooseImage.swift
//  Checklists
//
//  Created by a on 4/29/17.
//  Copyright © 2017 a. All rights reserved.
//

import UIKit

class ChooseImageTableViewController: UITableViewController {
    var ArrayofImages = [#imageLiteral(resourceName: "No Icon"),#imageLiteral(resourceName: "Appointments"),#imageLiteral(resourceName: "Birthdays"),#imageLiteral(resourceName: "Chores"),#imageLiteral(resourceName: "Drinks"),#imageLiteral(resourceName: "Folder"),#imageLiteral(resourceName: "Groceries"),#imageLiteral(resourceName: "Inbox"),#imageLiteral(resourceName: "Photos"),#imageLiteral(resourceName: "Trips")]
    var namesOfImage = ["No Icon","Appointments","Birthdays","Chores","Drinks","Folder","Groceries","Inbox","Photos","Trips"]
    public weak var delegate :GetImageDelegate!
    override func viewDidLoad() {
         print("hoho")
        super.viewDidLoad()
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return namesOfImage.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageTableViewCell
        cell.ImageButton.setImage(ArrayofImages[indexPath.row], for: .normal)
        cell.ImageName.text = namesOfImage[indexPath.row]

      

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ha")
        delegate.chosenimage(ArrayofImages[indexPath.row])
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
protocol GetImageDelegate : class{
    func chosenimage(_ image :UIImage)
    
}
