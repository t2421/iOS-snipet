//
//  DynamicTableViewController.swift
//  iOS-snipets
//
//  Created by taigakiyotaki on 2015/08/17.
//  Copyright (c) 2015年 taigakiyotaki. All rights reserved.
//

import UIKit

class DynamicTableViewController: UITableViewController {
    var count = 0;
    var items:Array<Dictionary<String,String>> = [
        [
            "name":"Wao1"
        ],
        [
            "name":"Wao2"
        ],
        [
            "name":"Wao3"
        ],
        [
            "name":"Wao4"
        ],
        [
            "name":"Wao5"
        ]
    ]
    var addButton:UIBarButtonItem!;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //セルの追加モードかセルの削除モードかを切り替える。（navigationBarに戻るボタンに使っているため、片方しか使えない）
        addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addItem:");
        
        self.navigationItem.rightBarButtonItems = [addButton,self.editButtonItem()];
        
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    //編集
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            self.items.removeAtIndex(indexPath.row);
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic);
        }
    }
    
    //セルの追加
    func addItem(sender:UIBarButtonItem){
        var item = ["name":"add"+String(count)];
        let indexPathToInsert = NSIndexPath(forRow: 0, inSection: 0);
        items.insert(item, atIndex: indexPathToInsert.row);
        self.tableView.insertRowsAtIndexPaths([indexPathToInsert], withRowAnimation: UITableViewRowAnimation.Automatic);
        count++;
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    //headerの上書き
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel();
        label.font = UIFont.systemFontOfSize(15.0);
        label.text = "ALL List";
        return label;
    }
    
    //headerの名前
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "All List";
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        cell.textLabel?.font = UIFont.systemFontOfSize(19.0);
        cell.textLabel?.text = items[indexPath.row]["name"];
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
