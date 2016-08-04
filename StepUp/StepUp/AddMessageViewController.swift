//
//  AddMessageViewController.swift
//  StepUp
//
//  Created by Cody Li on 8/4/16.
//  Copyright © 2016 Cody Li. All rights reserved.
//

import Foundation
import UIKit

//protocol AddMessageViewControllerDelegate {
//    func controller(controller: AddMessageViewController, didSaveMessage message: String)
//}

class AddMessageViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var messageField: UITextView!
    var message: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneSegue" {
            message = messageField.text
        }
    }
    
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}