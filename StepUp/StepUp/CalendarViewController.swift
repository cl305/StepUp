//
//  CalendarViewController.swift
//  StepUp
//
//  Created by Cody Li on 8/9/16.
//  Copyright © 2016 Cody Li. All rights reserved.
//

import Foundation
import UIKit
import CVCalendar
class CalendarViewController: UIViewController {
    
    @IBOutlet var menuBar: CVCalendarMenuView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var calendarView: CVCalendarView!
    
  
    var shouldShowDaysOut = true
    var animationFinished = true
    
    var selectedDay:DayView!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuBar.commitMenuViewUpdate()
        calendarView.commitCalendarViewUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = CVDate(date: NSDate()).globalDescription
    }
}








