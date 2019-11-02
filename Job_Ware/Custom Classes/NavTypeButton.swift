//
//  NavTypeButton.swift
//  Job_Ware
//
//  Created by Mac on 03/11/2019.
//  Copyright © 2019 DND. All rights reserved.
//

import Foundation
import UIKit

class NavTypeButton : UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    func setupButton(){
        setTitleColor(UIColor.white, for: .normal)
        //backgroundColor = UIColor.white.withAlphaComponent(1.0)
        layer.cornerRadius = frame.size.width/2
    }
}

