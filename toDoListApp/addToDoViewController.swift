//
//  addToDoViewController.swift
//  toDoListApp
//
//  Created by anjali brahmasandra on 8/2/22.
//

import UIKit

class addToDoViewController: UIViewController {
    var previousVC = ToDoTableViewController()
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var importantSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        let ToDo = toDo()

          if let titleText = titleTextField.text {
            ToDo.name = titleText
            ToDo.important = importantSwitch.isOn
        }
        previousVC.toDos.append(ToDo)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
