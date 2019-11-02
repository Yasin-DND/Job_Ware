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
    @IBOutlet weak var titleText : UILabel!
    @IBOutlet weak var detailsText : UILabel!
    @IBOutlet weak var contactText : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.text = jObject.jobTitle
        detailsText.text = jObject.jobDetails
        contactText.text = jObject.contactDetail
        print(jObject)
    }
}
