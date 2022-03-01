//
//  PlusButton.swift
//  TestApplication
//
//  Created by  SandyTwix on 23.02.2022.
//

import UIKit

class PlusButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.borderWidth = 2
        self.layer.borderColor = #colorLiteral(red: 0.4197242064, green: 0.774433588, blue: 0.923857868, alpha: 1)
        self.layer.cornerRadius = 25
    }
}
