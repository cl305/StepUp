//
//  MMViewController.swift
//  StepUp
//
//  Created by Cody Li on 8/3/16.
//  Copyright © 2016 Cody Li. All rights reserved.
//

import Foundation
import UIKit

class MMViewController: UITableViewController {
    
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    var messageArray : [String] = ["hey", "good"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 20)!]
        
        if CFloat(UIDevice.currentDevice().systemVersion)! >= 7 {
            tableView.contentInset = UIEdgeInsetsMake(-40, 0, 0, 0)
        }

        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 3
        let cell = tableView.dequeueReusableCellWithIdentifier("MessageCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.font = UIFont(name: "AvenirNext-Regular", size: 16)
        cell.textLabel?.text = messageArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            messageArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func done(segue: UIStoryboardSegue) {
        let messageDetailVC = segue.sourceViewController as! AddMessageViewController
        messageArray.append(messageDetailVC.message)
        print(messageDetailVC.message)
        self.tableView.reloadData()
    }
    
    @IBAction func saveToMainViewcontroller (segue: UIStoryboardSegue) {
        let detailViewController = segue.sourceViewController as! EditMessageViewController
        let index = detailViewController.index
        let editString = detailViewController.editedMessage
        messageArray[index!] = editString!
        self.tableView.reloadData()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "edit" {
            let path = tableView.indexPathForSelectedRow
            let detailViewController = segue.destinationViewController as! EditMessageViewController
            detailViewController.index = path?.row
            detailViewController.modelArray = messageArray
            
        }
    }
   
}