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
    @IBOutlet weak var calendarDetailTable: UITableView!
    
    var dateArray : [String] = ["August 16, 2016", "August 17, 2016"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date = moment()
        calendar.delegate = self
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //Rounded table corners
        let containerView: UIView = UIView(frame: self.calendarDetailTable.frame)
        calendarDetailTable.layer.cornerRadius = 10
        calendarDetailTable.layer.masksToBounds = true
        self.view.addSubview(containerView)
        self.view.addSubview(calendarDetailTable)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    var date: Moment! {
        didSet {
            title = date.format("MMMM, yyyy")
        }
    }
    
}

extension CalendarViewController: CalendarViewDelegate {
    
    func calendarDidSelectDate(date: Moment) {
        self.date = date
//        print("hey")
    }
    
    func calendarDidPageToDate(date: Moment) {
        self.date = date
    }
}

extension CalendarViewController: UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DateCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = dateArray[indexPath.row]
        return cell
        
    }
    
    
    
    
}






