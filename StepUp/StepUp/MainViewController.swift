//
//  MainViewController.swift
//  StepUp
//
//  Created by Cody Li on 8/2/16.
//  Copyright © 2016 Cody Li. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UITableViewController {
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}