//
//  KidCell.swift
//  TestApplication
//
//  Created by  SandyTwix on 23.02.2022.
//

import UIKit

class KidCell: UITableViewCell {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    var kid: Kid?
    var indexPath: IndexPath?
    var delegate: KidDelegate?
    var deleteDelegate: DeleteRowDelegate?

    func configure(_kid: Kid) {
        
        kid = _kid
        nameTextField.text = kid?.name
        
        if kid?.age != nil {
            
            ageTextField.text = String((self.kid?.age)!)
            
        } else if
            
            kid?.age == nil {
            ageTextField.text = ""
            }
       }

    @IBAction func deleteRow(_ sender: UIButton) {
        
        if deleteDelegate != nil, let indexPath = indexPath {
            
            deleteDelegate?.deleteRow(at: indexPath)
        }
    }
    
    @IBAction func nameAddTextField(_ sender: UITextField) {
        
            if delegate != nil, let indexPath = indexPath, kid != nil {
                
               kid!.name = nameTextField.text
                delegate?.saveKid(at: indexPath, kid: kid!)
            }
        }
            
        @IBAction func ageAddTextField(_ sender: UITextField) {
            
            if delegate != nil, let indexPath = indexPath, kid != nil {
                
               if let age = Int(ageTextField.text!) {
               kid!.age = age
               }
               delegate!.saveKid(at: indexPath, kid: kid!)
            }
        }
}
