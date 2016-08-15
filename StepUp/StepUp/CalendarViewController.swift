//
//  CalendarViewController.swift
//  StepUp
//
//  Created by Cody Li on 8/9/16.
//  Copyright © 2016 Cody Li. All rights reserved.
//

import Foundation
import UIKit
import CalendarView
import SwiftMoment

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var calendar: CalendarView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var date: Moment! {
        didSet {
            title = date.format("MMMM d, yyyy")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date = moment()
        calendar.delegate = self
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}

extension CalendarViewController: CalendarViewDelegate {
    
    func calendarDidSelectDate(date: Moment) {
        self.date = date
        print("hey")
    }
    
    func calendarDidPageToDate(date: Moment) {
        self.date = date
    }
}








