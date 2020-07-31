//
//  ToDoTableViewController.swift
//  FinalProject
//
//  Created by Darby Lee-Stack on 7/30/20.
//  Copyright © 2020 Mia Yan. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var listOfToDo : [ToDoCD] = []
    
    func createToDo() -> [ToDoClass] {
        
        let task1 = ToDoClass()
        task1.description = "Don't use single-use plastic"
        task1.important = true
        
        let task2 = ToDoClass()
        task2.description = "Take public transportation"
        
        return [task1, task2]
    }
    
    func viewWillAppear(_animated: Bool) {
        getToDos()
    }
   
    
   
    func getToDos() {
        if let accessToCoreData =
            (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        if let dataFromCoreData = try? accessToCoreData.fetch(ToDoCD.fetchRequest()) as? [ToDoClass] {
         /*
            listOfToDo = dataFromCoreData
                 tableView.reloadData()
           */
                 }

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

 
    func tableView(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

      let eachToDo = listOfToDo[indexPath.row]

        if let thereIsDescription = eachToDo.descriptionInCD {
             if eachToDo.importantInCD {
           cell.textLabel?.text = "❗️" + thereIsDescription
            } else {
           cell.textLabel?.text = eachToDo.descriptionInCD
            }
        }

        return cell
    
    


 // MARK: - Table view data source


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return listOfToDo.count
    }
 
    // MARK: - Navigation

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddToDoVC = segue.destination as?
            AddToDoViewController {
            nextAddToDoVC.previousToDoTVC = self
        }
        
        if let nextCompletedToDoVC = segue.destination as? CompletedToDoViewController {
             if let choosenToDo = sender as? ToDoCD {
                  nextCompletedToDoVC.selectedToDo = choosenToDo
                  nextCompletedToDoVC.previousToDoTVC = self
             }
        }
        

}
}
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         // this gives us a single ToDo
         let eachToDo = listOfToDo[indexPath.row]

         performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
    }

}
