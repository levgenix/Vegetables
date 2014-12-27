//
//  ViewController.swift
//  Vegetables
//
//  Created by Evgeny Lobach on 27.12.14.
//  Copyright (c) 2014 The Ministry. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let vegetables: Vegetables = Vegetables()
    var counter:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false

        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewVegetable:")
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    func insertNewVegetable(sender: AnyObject) {
        let name = "Чудо овощ \(++counter)"
        var veg = vegetables.prices.updateValue(Double(arc4random() % 256 * 100) / 255, forKey: name)
        println("Добавляем новую запись = \(name)")
        // Обратите внимание, что мы не можем вставить запись методом self.tableView.insertRowsAtIndexPaths, потому как наш vegetables.prices - неупорядоченный тип данных
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return vegetables.namesList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Обратите внимание, я не проверяю значения на nil
        let row = indexPath.row //получаем массив индексов
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) as UITableViewCell // создаем ячейку
        let myRowKey = vegetables.namesList[row] // ключ словаря
        cell.textLabel?.text = myRowKey
        let myRowData =  vegetables.prices[myRowKey] // значение словаря
        cell.detailTextLabel?.text = String(format: "%6.2f",myRowData!)
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            var name = vegetables.namesList[indexPath.row]
            println("Удаляем элемент \(name)")
            vegetables.prices.removeValueForKey(name)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
