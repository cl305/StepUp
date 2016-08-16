//
//  DashboardViewController.swift
//  StepUp
//
//  Created by Cody Li on 8/2/16.
//  Copyright © 2016 Cody Li. All rights reserved.
//

import Foundation
import UIKit

class DashboardViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController!.navigationBar.barTintColor = UIColor(red:75/255, green:114/255, blue:13/255, alpha:1.0)
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 20)!]
        // Do any additional setup after loading the view, typically from a nib.
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        navigationController?.navigationBar.barTintColor = UIColor.lightGrayColor()
    }
}