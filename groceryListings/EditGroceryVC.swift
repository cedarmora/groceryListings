//
//  EditGroceryVC.swift
//  groceryListings
//
//  Created by Cedar Mora on 6/1/16.
//  Copyright © 2016 Cedar Mora. All rights reserved.
//

import UIKit

class EditGroceryVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var editGroceryData : [String : String]!
    
    var index = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLbl.text = editGroceryData["name"]
        self.quantityLbl.text = editGroceryData["quantity"]
        self.descriptionLabel.text = editGroceryData["description"]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addQntyBtnAction(sender: AnyObject) {
        if Int(quantityLbl.text!)! < 10000 {
            let value = Int(quantityLbl.text!)! + 1
            quantityLbl.text = "\(value)"
        }
    }
    
    @IBAction func minusQntyBtnAction(sender: AnyObject) {
        if Int(quantityLbl.text!) > 0 {
            let value = Int(quantityLbl.text!)! - 1
            quantityLbl.text = "\(value)"
        }
    }

    @IBAction func saveBtnAction(sender: AnyObject) {
        let groceryDictionary = ["name":nameLbl.text!,
                                 "quantity": quantityLbl.text!,
                                 "description": descriptionLabel.text!]
        
        if var groceryListArray = NSUserDefaults.standardUserDefaults().objectForKey("defaultList") as? [[String : String]] {
            groceryListArray.removeAtIndex(index)
            
            groceryListArray.insert(groceryDictionary, atIndex: index)
            NSUserDefaults.standardUserDefaults().setObject(groceryListArray, forKey: "defaultList")
        }
        
        NSUserDefaults.standardUserDefaults().synchronize()
        navigationController?.popToRootViewControllerAnimated(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
