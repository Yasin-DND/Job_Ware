//
//  DNDButton.swift
//  SA1
//
//  Created by Mac on 21/09/2019.
//  Copyright © 2019 DND. All rights reserved.
//

import Foundation
import UIKit

class DNDButton : UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    func setupButton(){
        backgroundColor = UIColor.white.withAlphaComponent(1.0)
        layer.cornerRadius = 13
    }
}
