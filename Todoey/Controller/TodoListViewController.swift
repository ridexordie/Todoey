//
//  ViewController.swift
//  Todoey
//
//  Created by Tunc on 21.01.2018.
//  Copyright © 2018 Tunc. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    // access to app delegate and persistent db context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        loadItems()
    }
    

    
    //MARK - Tableview datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        return cell
    }
    
    
    
    //MARK - Tableview delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //delete
        //context.delete(itemArray[indexPath.row])
        //itemArray.remove(at: indexPath.row)
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
    
        saveItems();
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    //MARK - Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var itemTextField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item(context: self.context)
            newItem.title = itemTextField.text!
            newItem.done = false
            self.itemArray.append(newItem)
 
            self.saveItems();
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            itemTextField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK - Model Manipulation
    
    func saveItems(){
       
        do {
           try self.context.save()
        }catch {
            print("Save Error: \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadItems() {

        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
           itemArray = try context.fetch(request)
        }catch {
            print("Read Error: \(error)")
        }
        
    }
    
}

