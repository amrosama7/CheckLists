//
//  MainTableViewController.swift
//  Checklists
//
//  Created by a on 4/23/17.
//  Copyright © 2017 a. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController ,AddCategoryDelegate{
    var cells:[MainListItem]
     var SelectedRow:IndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("CheckLists.plist")
    }
    func saveMainListitems(){
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(cells,forKey: "MainlistItems")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
        
    }
    
    func DoneAdding(_ image :UIImage, _ name :String)
    {
        let newRowIndex = cells.count
        let tot = MainListItem()
        tot.text.text = name
       
            tot.image = image
        
        cells.append(tot)
        let indexPath = IndexPath(row : newRowIndex,section: 0)
        let indexpaths = [indexPath]
        tableView.insertRows(at: indexpaths, with: .automatic)
    }
    func DoneEditting(_ image :UIImage, _ name :String)
    {
        cells[SelectedRow.row].image = image
        cells[SelectedRow.row].text.text = name
        tableView.reloadRows(at: [SelectedRow], with: .automatic)
        SelectedRow = nil
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        cells.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic);
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("hoba2")
        if segue.identifier == "AddMainCell"  {
        if let nav = segue.destination as? UINavigationController{
            let tab = nav.topViewController as? AddingCategoryTableViewController
            tab?.delegate = self
            }}
        else if segue.identifier == "EditMainCell"{
            if let nav = segue.destination as? UINavigationController{
                let tab = nav.topViewController as? AddingCategoryTableViewController
                tab?.delegate = self
                if let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
                {
                    SelectedRow = indexPath
                    tab?.texto = cells[indexPath.row].text
                    tab?.image = cells[indexPath.row].image
                }
            }
            
            
        }else if segue.identifier == "ShowCheckList"{
            if let tab = segue.destination as? CheckListViewController{
               
               
                if let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
                {    SelectedRow = indexPath
                    tab.items = cells[indexPath.row].items
                    tab.tittle = cells[indexPath.row].text.text
                }
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        print("hoba")
        cells = [MainListItem]()
  
       
        
        
        super.init(coder: aDecoder)
        loadMainListItems()
    }
    func loadMainListItems(){
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path){
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            cells = unarchiver.decodeObject(forKey: "MainlistItems") as! [MainListItem]
            unarchiver.finishDecoding()
            
        }
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
        return cells.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }
    override func viewDidAppear(_ animated: Bool) {
        if let indexRow = SelectedRow{
            tableView.reloadRows(at: [indexRow], with: .automatic)
            SelectedRow = nil
        }
        saveMainListitems()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableCell", for: indexPath) as! MainTableViewCell
        cell.Label.text = cells[indexPath.row].text.text
        cell.NumberOfItems.text = String(cells[indexPath.row].items.items.count)
        if let image = cells[indexPath.row].image{
            cell.ImageButton.setImage(image, for: .normal)
        }else{
            cells[indexPath.row].image = #imageLiteral(resourceName: "No Icon")
            cell.ImageButton.setImage(#imageLiteral(resourceName: "No Icon"), for: .normal)
        }

        // Configure the cell...

        return cell
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
