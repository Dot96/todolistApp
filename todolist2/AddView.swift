//
//  AddView.swift
//  todolist2
//
//  Created by Abrar Ibrahim on 20/01/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import UIKit
import CoreData

class AddView: UIViewController {
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var isimportent: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SaveNote(_ sender: Any) {

        
        if textField.text!.isEmpty  {
        let ac = UIAlertController(title: "Ops!", message: "Write Your Task ", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: false)
        }
        else {
            let note = Notes(context:context)
            note.text = textField.text!
            note.isImportent = isimportent.isOn
        //Save the Data to Coredate
        ad.saveContext()
        navigationController?.popViewController(animated: true)
        }
        
        
    }
}
