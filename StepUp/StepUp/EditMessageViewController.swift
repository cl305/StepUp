//
//  EditMessageViewController.swift
//  StepUp
//
//  Created by Cody Li on 8/5/16.
//  Copyright © 2016 Cody Li. All rights reserved.
//

class EditMessageViewController: UITableViewController {

    @IBOutlet weak var editMessageField: UITextField!
    var index:Int?
    
    var modelArray:[String]!
    var editedMessage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editMessageField.text = modelArray[index!]
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            editMessageField.becomeFirstResponder()
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "save" {
            editedMessage = editMessageField.text
        }
    }
}
