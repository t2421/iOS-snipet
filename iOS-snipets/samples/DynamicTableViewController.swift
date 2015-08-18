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
    let listSectionTitle:String = "ALL LIST";
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
    
    //headerのスタイルを上書き
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var screenW = UIScreen.mainScreen().bounds.size.width
        let view:UIView = UIView();
        view.backgroundColor = UIColor.grayColor();
        
        view.frame.size.width = screenW;
        
        let label = UILabel();
        label.frame.origin.x = 15;
        label.frame.origin.y = 2;
        label.font = UIFont.systemFontOfSize(15.0);
        label.textColor = UIColor.whiteColor();
        label.text = listSectionTitle;
        label.sizeToFit();
        view.addSubview(label);
        view.frame.size.height = label.frame.size.height;
        
        return view;
    }
    
    //headerの名前
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listSectionTitle;
    }
    
    
    
    //編集時にセルを移動する
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        tableView.moveRowAtIndexPath(sourceIndexPath, toIndexPath:destinationIndexPath);
        
        var itemToMove = self.items[sourceIndexPath.row];
        self.items.removeAtIndex(sourceIndexPath.row);
        self.items.insert(itemToMove, atIndex: destinationIndexPath.row);
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        cell.textLabel?.font = UIFont.systemFontOfSize(19.0);
        cell.textLabel?.text = items[indexPath.row]["name"];
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.editing = true;
    }

    
}
