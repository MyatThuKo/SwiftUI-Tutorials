//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Myat Thu Ko on 2/13/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Creating AppDelegate to access the PersistentContainer 
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }


}

