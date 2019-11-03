//
//  JobDetailsViewController.swift
//  Job_Ware
//
//  Created by Mac on 02/11/2019.
//  Copyright © 2019 DND. All rights reserved.
//

import UIKit

class JobDetailsViewController: UIViewController {

    var jObject = JobClass()
    @IBOutlet weak var titleText : UIButton!
    @IBOutlet weak var detailsText : UIButton!
    @IBOutlet weak var contactText : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.setTitle(jObject.jobTitle, for: .normal)
        detailsText.setTitle(jObject.jobDetails, for: .normal)
        contactText.setTitle(jObject.contactDetail, for: .normal)
        
    }
    @IBAction func callButton(sender: AnyObject) {
        //UIApplication.shared.openURL(NSURL(string: "tel://9809088798")! as URL)

    }
}
