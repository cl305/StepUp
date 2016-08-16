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
    
    //Progress ring section
    @IBOutlet var progressCircle: KDCircularProgress!
    @IBOutlet var stepsToGoal: UILabel! //Default set to 10000
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var currentSteps: UILabel!
    @IBOutlet var uploadVideoButton: UIButton!
    
    //Top left
    @IBOutlet var currentActivityTime: UILabel!
    
    //Top right
    @IBOutlet var currentUploadCount: UILabel!
    @IBOutlet var abstinentPayoutCount: UILabel!
    
    //Bottom left
    @IBOutlet var goalPayout: UILabel!
    @IBOutlet var payoutIfWearingWatch: UILabel!
    
    //Bottom right
    @IBOutlet var totalEarned: UILabel!
    @IBOutlet var abstinenceEarned: UILabel!
    @IBOutlet var exerciseEarned: UILabel!
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 20)!]
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }
    
    @IBAction func uploadVideo(sender: AnyObject) {
        //TODO: Implement video uploading functionality.
    }
    
}
