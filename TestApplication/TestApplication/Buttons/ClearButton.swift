//
//  ClearButton.swift
//  TestApplication
//
//  Created by  SandyTwix on 23.02.2022.
//

import UIKit

class ClearButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.borderWidth = 2
        self.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        self.layer.cornerRadius = 25
    }
}
