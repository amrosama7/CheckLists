//
//  CheckListTableViewController.swift
//  Checklists
//
//  Created by a on 4/17/17.
//  Copyright © 2017 a. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController, additemviewcontrollerDelegate {

    @IBOutlet var navo: UINavigationItem!
    var tittle = ""
    
    var items:ArrayOfCells = ArrayOfCells()
    override func viewDidLoad() {
        super.viewDidLoad()
 navo.title = tittle
    }
    
    @IBAction func Back(_ sender : Any) {
        print("yala")
   
        dismiss(animated: true, completion: nil)
        
        print("beena")
        
        
    }
    required init?(coder aDecoder: NSCoder) {
      
        
//        let row0item = ChecklistItem()
//        row0item.text = "Walk the dog"
//        row0item.checked = false
//        items.items.append(row0item)
//        
//        let row1item = ChecklistItem()
//        row1item.text = "Brush my teeth"
//        row1item.checked = true
//        items.items.append(row1item)
//        
//        let row2item = ChecklistItem()
//        row2item.text = "Learn iOS development"
//        row2item.checked = true
//        items.items.append(row2item)
//        
//        let row3item = ChecklistItem()
//        row3item.text = "Soccer practice"
//        row3item.checked = false
//        items.items.append(row3item)
//        
//        let row4item = ChecklistItem()
//        row4item.text = "Eat ice cream"
//        row4item.checked = true
//        items.items.append(row4item)
       
        super.init(coder: aDecoder)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath) as! TableViewCell
        
    
        
        cell.Labeli.text = items.items[indexPath.row].text
        if items.items[indexPath.row].checked{
            cell.CheckMArk.text = "✔️"
        }else{
            cell.CheckMArk.text = ""
        }

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
items.items[indexPath.row].checked = !items.items[indexPath.row].checked
        if let cell = tableView.cellForRow(at: indexPath) as? TableViewCell{
        
            if cell.CheckMArk.text == ""{
            
                cell.CheckMArk.text = "✔️"
            }else{
                cell.CheckMArk.text = ""
            }
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic);
    }
    func cancelo(_ tableview: TableView2) {
//        dismiss(animated: true, completion: nil)
    }
    func dono(_ tableview: TableView2, _ item: ChecklistItem) {
//        dismiss(animated: true, completion: nil)
          let newRowIndex = items.items.count
        items.items.append(item)
        let indexPath = IndexPath(row : newRowIndex,section: 0)
        let indexpaths = [indexPath]
        tableView.insertRows(at: indexpaths, with: .automatic)
    }
    func edit(_ tableview: TableView2, _ item: ChecklistItem) {
   let index = items.items.index(of: item)
        let indexPath = IndexPath(row: index!, section:0)
        let indexPaths = [indexPath]
        tableView.reloadRows(at: indexPaths, with: .automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "TableView2"  {
            if let nav = segue.destination as? UINavigationController{
                let tab = nav.topViewController as? TableView2
                tab?.delegate = self
            }
        }else
        {
            if segue.identifier == "EditViewController"{
                if let nav = segue.destination as? UINavigationController{
                    let tab = nav.topViewController as? TableView2
                    tab?.delegate = self
                    if let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
                    {
                        tab?.checklist = items.items[indexPath.row]
                    }
                }
                
            }
        }
    }
    
    @IBAction func additem(_ sender: UIBarButtonItem) {
        let newRowIndex = items.items.count
        let item = ChecklistItem()
        item.checked = false
        item.text = "I am a new row"
        items.items.append(item)
        let indexPath = IndexPath(row : newRowIndex,section: 0)
        let indexpaths = [indexPath]
        tableView.insertRows(at: indexpaths, with: .automatic)
        
        
    }
    
    
    
    
}
