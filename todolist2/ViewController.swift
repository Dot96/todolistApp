//
//  ViewController.swift
//  todolist2
//
//  Created by Abrar Ibrahim on 20/01/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tablevie: UITableView!
    
    var notes = [Notes]() {
        didSet {
            tablevie.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablevie.dataSource = self
        tablevie.delegate = self
    }
    
    /// //get data from Coredate ( loadNote)
    override func viewWillAppear(_ animated: Bool) {
        loadNote()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func loadNote() {
        do{
            notes = try context.fetch(Notes.fetchRequest())
        } catch {
            print ("Error") // when fetching is Failed
        }
    }
}

extension ViewController: UITableViewDelegate , UITableViewDataSource {
    // to load the save Notes to Table view
    ///   - indexPath: the section in the table clarification where the cell place
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let note = notes[indexPath.row]
        
        if note.isImportent {
            let Str = "importemt"
            cell.textLabel?.text = " importent : [\(note.text!)]"
        }
        else {
            cell.textLabel?.text = note.text
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let delitem = notes[indexPath.row]
            context.delete(delitem)
            ad.saveContext()
            do {
                notes = try context.fetch(Notes.fetchRequest())
            } catch {
                print("error")
            }
        }
    }
}
