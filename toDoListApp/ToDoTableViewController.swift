//
//  ToDoTableViewController.swift
//  toDoListApp
//
//  Created by anjali brahmasandra on 8/1/22.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var toDos : [toDo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDos = createToDos()
    }

    func createToDos() -> [toDo] {
        let swift = toDo()
        swift.name = "learn swift"
        swift.important = true
        
        let dog = toDo()
        dog.name = "walk the dog"
        
        let clean = toDo()
        clean.name = "clean my room"
        
        return [swift, dog, clean]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let ToDo = toDos[indexPath.row]
        
        if ToDo.important {
            cell.textLabel?.text = "⭐️" + ToDo.name
        } else {
            cell.textLabel?.text = "⬇️" + ToDo.name
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ToDo = toDos[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: ToDo)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? addToDoViewController {
            addVC.previousVC = self
          }
        if let completeVC = segue.destination as? completeToDoViewController {
            if let toDo = sender as? toDo {
              completeVC.selectedToDo = toDo
              completeVC.previousVC = self
            }
        }
    }
}
