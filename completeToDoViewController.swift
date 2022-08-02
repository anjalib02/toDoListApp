//
//  completeToDoViewController.swift
//  toDoListApp
//
//  Created by anjali brahmasandra on 8/2/22.
//

import UIKit

class completeToDoViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    var previousVC = ToDoTableViewController()
    var selectedToDo = toDo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = selectedToDo.name

        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeTapped(_ sender: Any) {
    }

}
