//
//  AddingCategory.swift
//  Checklists
//
//  Created by a on 4/29/17.
//  Copyright © 2017 a. All rights reserved.
//

import UIKit

class AddingCategoryTableViewController: UITableViewController,GetImageDelegate {
    var image:UIImage!
    @IBOutlet var ImgButton: UIButton!
    
    @IBOutlet var DoneButton: UIBarButtonItem!
    @IBOutlet var TextField: UITextField!
    public weak var delegate :AddCategoryDelegate!
    var texto : MyString?
    override func viewDidLoad() {
        super.viewDidLoad()
        if(texto != nil)
        {
            TextField.text = texto?.text
        }
        else
        {
           DoneButton.isEnabled = false
        }
        TextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
 
        
        RefreshImage()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewDidAppear(_ animated: Bool) {
        TextField.becomeFirstResponder()
    }
    func RefreshImage(){
        if(image != nil && image != #imageLiteral(resourceName: "No Icon")){
            ImgButton.setImage(image, for: .normal)
            ImgButton.setTitle("Change Image", for: .normal)
        }else{
            ImgButton.setImage(#imageLiteral(resourceName: "No Icon"), for: .normal)
            ImgButton.setTitle("Add Image", for: .normal)
        }
    }
    func textFieldDidChange(_ textField: UITextField) {
        if textField.text == ""{
            DoneButton.isEnabled = false
        }else{
            DoneButton.isEnabled = true
        }
        
    }
   
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Done(_ sender: UIBarButtonItem) {
        if texto == nil{
            if(self.image != nil){
                delegate.DoneAdding(image, TextField.text!)}
            else {
                delegate.DoneAdding(#imageLiteral(resourceName: "No Icon"), TextField.text!)
            }
        }else{
            delegate.DoneEditting(image, TextField.text!)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func chosenimage(_ image :UIImage){
        self.image = image
        RefreshImage()
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Image"  {
            if let tab = segue.destination as? ChooseImageTableViewController{
                
                tab.delegate = self
            }}
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
protocol AddCategoryDelegate : class{
    func DoneAdding(_ image :UIImage, _ name :String)
    func DoneEditting(_ image :UIImage, _ name :String)
    
}
