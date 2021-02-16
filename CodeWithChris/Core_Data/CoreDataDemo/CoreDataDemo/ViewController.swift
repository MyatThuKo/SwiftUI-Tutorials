//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Myat Thu Ko on 2/13/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    // Reference to managed object contxt
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Data for the table
    var items:[Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Get items from Core Data
        fetchPeople()
    }
    
    func fetchPeople() {
        // Fetch the data from Core Data to display in the tableView
        do {
            self.items = try! context.fetch(Person.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            
        }
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        
        // Create alert
        let alert = UIAlertController(title: "Add Person", message: "What is their name?", preferredStyle: .alert)
        alert.addTextField()
        
        // Configure button handler
        let submitButton = UIAlertAction(title: "Add", style: .default) { (action) in
            // Get the textField for the alert
            let textfield = alert.textFields![0]
            
            // Create a person object
            let newPerson = Person(context: self.context)
            newPerson.name = textfield.text
            newPerson.age = 20
            newPerson.gender = "Male"
            
            // Save the data
            do {
                try! self.context.save()
            }
            catch {
                
            }
            
            // ToDo: Re-fetch the data
            self.fetchPeople()
        }
        
        // Add Button
        alert.addAction(submitButton)
        
        // Show Alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        
        // Get person from array and set the label
        let person = self.items![indexPath.row]
        
        cell.textLabel?.text = person.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Selected Person
        let person = self.items![indexPath.row]

        // Create alert
        let alert = UIAlertController(title: "Edit Person", message: "Edit name:", preferredStyle: .alert)
        alert.addTextField()

        let textField = alert.textFields![0]
        textField.text = person.name

        // Configure button handler
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in

            // Get the textField for the alert
            let textField = alert.textFields![0]

            // Edit name property of person object
            person.name = textField.text

            // Save the data
            do {
                try! self.context.save()
            }
            catch {
                
            }

            // Re-fetch the data
            self.fetchPeople()
        }
        
        // Add Button
        alert.addAction(saveButton)
        
        // Show alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Create swipe action
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, copletionHandler) in
            // Which person to remove
            let personToRemove = self.items![indexPath.row]
            
            // Remove the person
            self.context.delete(personToRemove)
            
            // Save the person
            do {
                try! self.context.save()
            }
            catch {
                
            }
            
            // Re-fresh the data
            self.fetchPeople()
        }
        
        // Return swipe action
        return UISwipeActionsConfiguration(actions: [action])
    }
}

