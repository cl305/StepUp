//
//  AddMessageViewController.swift
//  StepUp
//
//  Created by Cody Li on 8/4/16.
//  Copyright © 2016 Cody Li. All rights reserved.
//

import Foundation
import UIKit

class AddMessageViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var addEditButton: UIBarButtonItem!
    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addEdit(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addMessage(sender: AnyObject) {
    }
    
    
}