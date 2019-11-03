//
//  DashBoardViewController.swift
//  Second App
//
//  Created by Mac on 25/09/2019.
//  Copyright © 2019 DND. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController{
    var cObject : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("Name\(cObject)")
    }
    override var prefersStatusBarHidden: Bool {
           return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DashToAdd"{
            let nav = segue.destination as! UINavigationController
            let controller = nav.topViewController as! AddJobViewController
            controller.postedBy = cObject
        }else if segue.identifier == "MyJobs"{
            let controller = segue.destination as! MyJobsTableViewController
            controller.postedBy = cObject
        }else if segue.identifier == "Profile"{
            let controller = segue.destination as! ProfileViewController
            controller.postedBy = cObject
        }
    }
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
}
