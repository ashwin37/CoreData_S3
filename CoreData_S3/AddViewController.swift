//
//  AddViewController.swift
//  CoreData_S3
//
//  Created by Ashwin Tallapaka on 1/27/17.
//  Copyright © 2017 Ashwin Tallapaka. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var txtFld: UITextField!
    @IBOutlet weak var isImp: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveBtn(_ sender: Any)
    {
        
      let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        task.name = txtFld.text
        task.isImportant = isImp.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
    }
}
