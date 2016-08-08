//
//  TodayGoalsViewController.swift
//  StepUp
//
//  Created by Cody Li on 8/7/16.
//  Copyright © 2016 Cody Li. All rights reserved.
//

import Foundation
import UIKit
import KDCircularProgress

class TodayGoalsViewController: UIViewController {
    
    @IBOutlet var progressCircle: KDCircularProgress!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }
}
