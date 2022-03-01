//
//  ViewController.swift
//  TestApplication
//
//  Created by  SandyTwix on 23.02.2022.
//

import UIKit

protocol KidDelegate {
    
    func saveKid(at indexPath: IndexPath, kid: Kid)
}

protocol DeleteRowDelegate {
    
    func deleteRow(at indexPath: IndexPath)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var AddButtonOutlet: UIButton!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!

    var kids: [Kid] = []
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
            addTapGesture()
        }
    
    @IBAction func AddButton(_ sender: UIButton) {
        
        let kid = Kid(name: nil, age: nil)
        kids.append(kid)
        tableView.reloadData()
                
        if kids.count == 5 {
            AddButtonOutlet.isHidden = true
        }
    }
    
    @IBAction func ClearButton(_ sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "Все данные будут удалены!", message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        actionSheet.addAction(UIAlertAction(title: "Сбросить данные", style: .default, handler: { _ in
            self.nameTF.text = ""
            self.ageTF.text = ""
            self.kids.removeAll()
            self.tableView.reloadData()
        }))
        present(actionSheet, animated: true)
    }
}




extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        kids.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! KidCell
        let kid = kids[indexPath.row]
        
        cell.delegate = self
        cell.deleteDelegate = self
        cell.indexPath = indexPath
        cell.configure(_kid: kid)
        
        return cell
    }
}


extension ViewController: KidDelegate {
    
    func saveKid(at indexPath: IndexPath, kid: Kid) {
        
        kids[indexPath.row] = kid
        tableView.reloadData()
    }
    
}


extension ViewController: DeleteRowDelegate {
    
    func deleteRow(at indexPath: IndexPath) {
        
        kids.remove(at: indexPath.row)
        tableView.reloadData()
        if kids.count < 5 {
            AddButtonOutlet.isHidden = false
        }
    }
}


extension ViewController {
    
    private func addTapGesture() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = true
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        
        view.endEditing(true)
    }

}
