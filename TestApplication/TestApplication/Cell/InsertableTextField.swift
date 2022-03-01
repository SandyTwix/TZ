//
//  InsertableTextField.swift
//  TestApplication
//
//  Created by  SandyTwix on 23.02.2022.
//

import UIKit

class InsertableTextField: UITextField {
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.8570924765, green: 0.8570924765, blue: 0.8570924765, alpha: 0.6026862158)
        self.layer.cornerRadius = 5
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.offsetBy(dx: 12, dy: 7)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        return textRect(forBounds: bounds)
    }
}
