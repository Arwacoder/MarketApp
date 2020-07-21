//
//  AddItemViewController.swift
//  Market
//
//  Created by Arwa Mahdai on 7/12/20.
//  Copyright © 2020 Arwa Mahdai. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

   //Mark: IBOutlets
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    //Mark: Vars
    var category: Category!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Mark: IBActions
    @IBAction func doneButtonClicked(_ sender: Any) {
    }
    
    @IBAction func cameraButtonClicked(_ sender: Any) {
    }
    
    @IBAction func backgroundClicked(_ sender: Any) {
        dismissKeyboard()
    }
    
    //Mark: Helper functions
    private func dismissKeyboard() {
        self.view.endEditing(false)
    }
    
    
    
    
    
    

}
