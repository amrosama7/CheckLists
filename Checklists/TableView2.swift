//
//  TableView2.swift
//  Checklists
//
//  Created by a on 4/22/17.
//  Copyright © 2017 a. All rights reserved.
//

import UIKit

class TableView2: UITableViewController {
    
    @IBOutlet var TextField: UITextField!
    var checklist: ChecklistItem?
    var texto: MyString?
  
    @IBOutlet var Donebutton: UIBarButtonItem!
    public weak var delegate :additemviewcontrollerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        if(checklist != nil)
        {
            TextField.text = checklist?.text
        }else if texto != nil{
            TextField.text = texto?.text
        }
        else{
            Donebutton.isEnabled = false
            
        }
        TextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        TextField.becomeFirstResponder()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func textFieldDidChange(_ textField: UITextField) {
        if textField.text == ""{
            Donebutton.isEnabled = false
        }else{
            Donebutton.isEnabled = true
        }
        
    }

    @IBAction func Cancel() {
        delegate.cancelo(self)
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Done() {
        let item = ChecklistItem()
        item.checked = false
        item.text = TextField.text ?? ""
        if(checklist == nil && texto == nil){
            delegate.dono(self, item )
        }else if texto != nil{
            texto?.text = TextField.text ?? ""
            delegate.edit(self, ChecklistItem())
            
        }
        else{
            
            checklist?.text = TextField.text ?? ""
           delegate.edit(self, checklist! )
        }
        
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
protocol additemviewcontrollerDelegate : class{
    func cancelo(_ tableview :TableView2)
    func dono(_ tableview :TableView2, _ item :ChecklistItem)
    func edit(_ tableview :TableView2, _ item :ChecklistItem)
}
