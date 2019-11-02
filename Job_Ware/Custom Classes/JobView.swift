//
//  JobView.swift
//  Second App
//
//  Created by Mac on 28/09/2019.
//  Copyright © 2019 DND. All rights reserved.
//

import Foundation
import UIKit

class JobView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    func setUpView(){
        backgroundColor = UIColor.gray.withAlphaComponent(1.0)
        layer.cornerRadius = 10.0
        layer.masksToBounds = false
    }
}
