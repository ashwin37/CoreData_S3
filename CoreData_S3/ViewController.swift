//
//  ViewController.swift
//  CoreData_S3
//
//  Created by Ashwin Tallapaka on 1/27/17.
//  Copyright © 2017 Ashwin Tallapaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TBV: UITableView!
    
    var tasksArray : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    TBV.delegate = self
    TBV.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Get the data from the core data
        
        getData() // It's the function name
        
        //Reload the tableview
        
        TBV.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task  = tasksArray[indexPath.row]
        
        if task.isImportant
        {
            cell.textLabel?.text = "😍\(task.name!)"  // To generate Smiley use CTRL + Command + SpaceBar keys // To eliminate optional value in Tableview in the final output just add ! mark at the end of the stringvalue

        }
        else
        {
        cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func getData()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do
        {
            tasksArray = try context.fetch(Task.fetchRequest())
        }
            
        catch{
            print("fetching failed")
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete
        {
          let task  = tasksArray[indexPath.row]
          context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do
            {
                tasksArray = try context.fetch(Task.fetchRequest())
            }
                
            catch{
                print("fetching failed")
            }
        }
        TBV.reloadData()
    }
   }
