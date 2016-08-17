//
//  RecordCOViewController.swift
//  StepUp
//
//  Created by Cody Li on 8/17/16.
//  Copyright © 2016 Cody Li. All rights reserved.
//

import Foundation
import MobileCoreServices

class RecordCOViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var recordButton: UIButton!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 20)!]
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        navigationController?.navigationBar.barTintColor = UIColor.lightGrayColor()
        
    }
    
    @IBAction func recordCOReading(sender: AnyObject) {
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            if UIImagePickerController.availableCaptureModesForCameraDevice(.Front) != nil {
                imagePicker.sourceType = .Camera
                imagePicker.mediaTypes = [kUTTypeMovie as String]
                imagePicker.allowsEditing = false
                imagePicker.delegate = self
                
                presentViewController(imagePicker, animated: true, completion: {})
            }
        }
        
    }
    
    
}

extension RecordCOViewController: UIImagePickerControllerDelegate {
    
}

extension RecordCOViewController: UINavigationControllerDelegate {
    
}