//
//  UITextField.swift
//  Second App
//
//  Created by Mac on 21/09/2019.
//  Copyright © 2019 DND. All rights reserved.
//

import Foundation
import UIKit

class TextField : UITextField{
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpTextField()
    }
    private func setUpTextField(){
        
        layer.cornerRadius = 13
        borderStyle = .none
        font = UIFont(name: "Avenir Next Condensed Regular", size: 22)
        backgroundColor = UIColor.white.withAlphaComponent(1.0)
        let frame = UIView(frame: CGRect(x: 0,y: 0,width: 5,height: 5))
        leftView = frame
        leftViewMode = .always
        autocorrectionType = .no
        clipsToBounds = true
        textColor = UIColor.black
        clipsToBounds = true
    }
}

