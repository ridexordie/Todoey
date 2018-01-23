//
//  ViewController.swift
//  Todoey
//
//  Created by Tunc on 21.01.2018.
//  Copyright © 2018 Tunc. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    //let defaults = UserDefaults.standard
    
     let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        seed()
        
//        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
//            itemArray = items
//        }
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
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
    
        saveItems();
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    //MARK - Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var itemTextField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            // what will happen once the user clicks the Add Item button on UIAlert
            let newItem = Item()
            newItem.title = itemTextField.text!
            
            self.itemArray.append(newItem)
            
            //self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
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
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(self.itemArray)
            try data.write(to: self.dataFilePath!)
        }catch {
            print("Error: \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    
    //MARK - SEED DATA
    func seed() {
        let newItem = Item()
        newItem.title = "Find Mike"
        newItem.done = true
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Call boss"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Buy eggs"
        itemArray.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "Repair car"
        itemArray.append(newItem4)
        
        let newItem5 = Item()
        newItem5.title = "Paint the wall"
        itemArray.append(newItem5)
        
        let newItem6 = Item()
        newItem6.title = "Buy 2 tickets to Iron Maiden"
        itemArray.append(newItem6)
        
        let newItem7 = Item()
        newItem7.title = "Eat dinner"
        itemArray.append(newItem7)
        
        let newItem8 = Item()
        newItem8.title = "Drink Vodka"
        itemArray.append(newItem8)
        
        let newItem9 = Item()
        newItem9.title = "Work iOS"
        itemArray.append(newItem9)
        
        let newItem10 = Item()
        newItem10.title = "Watch the BJK"
        itemArray.append(newItem10)
        
        let newItem11 = Item()
        newItem11.title = "Set the alarm"
        itemArray.append(newItem11)
        
        let newItem12 = Item()
        newItem12.title = "Sleep at 01:00"
        itemArray.append(newItem12)
        
        let newItem13 = Item()
        newItem13.title = "Drink water"
        itemArray.append(newItem13)
        
        let newItem14 = Item()
        newItem14.title = "Brush your teeth"
        itemArray.append(newItem14)
    }
    
}

