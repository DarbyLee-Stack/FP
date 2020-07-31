//
//  AddToDoViewController.swift
//  FinalProject
//
//  Created by Darby Lee-Stack on 7/30/20.
//  Copyright © 2020 Mia Yan. All rights reserved.
//

import UIKit

import CoreData

class AddToDoViewController: UIViewController {

    var previousToDoTVC = ToDoTableViewController ()
    
    @IBOutlet weak var descriptionInput: UITextField!
    @IBOutlet weak var switchInput: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        
        //this line creates a reference that allows us access to the Core Data.  It uses functions prewritten and stored in AppDelegate.swift.  We use guard let to conditional unwrap the Core Data.
             guard let accessToCoreData = UIApplication.shared.delegate as? AppDelegate else {
             return
             }

        //this line stores the information from Core Data into the object (dataFromCoreData) that we can access.
             let dataFromCoreData = accessToCoreData.persistentContainer.viewContext

        //this line creates an empty object that is the same data type as the ToDoCD entry within Core Data.  This means this object will have all the properties of ToDoCD.
             let newToDo = ToDoCD(context: dataFromCoreData)

        //these lines give the object information from the user input
             newToDo.descriptionInCD = descriptionInput.text
             newToDo.importantInCD = switchInput.isOn

        //This is like clicking "save"! Our new object is now safe in Core Data!
             accessToCoreData.saveContext()

        //this send the user back to the Table View Controller
             navigationController?.popViewController(animated: true)
        }

    
    /*
     
         let newToDo = ToDoClass()
         
         if let checkForInput = descriptionInput.text {
             newToDo.description =  checkForInput
             newToDo.important = switchInput.isOn
         }

         previousToDoTVC.listOfToDo.append(newToDo)
         previousToDoTVC.tableView.reloadData()
         navigationController?.popViewController(animated: true)
     }
     
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
