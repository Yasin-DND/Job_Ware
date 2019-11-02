//
//  TipViewController.swift
//  Job_Ware
//
//  Created by Mac on 02/11/2019.
//  Copyright © 2019 DND. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override var prefersStatusBarHidden: Bool {
              return true
    }
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
   
}
