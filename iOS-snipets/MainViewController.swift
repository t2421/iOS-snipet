//
//  MainViewController.swift
//  iOS-snipets
//
//  Created by taigakiyotaki on 2015/07/14.
//  Copyright (c) 2015年 taigakiyotaki. All rights reserved.
//
//  @see https://github.com/shu223/iOS8-Sampler/blob/master/iOS8Sampler/MasterViewController.m

import UIKit

class MainViewController: UITableViewController {
    
    let items:Array<Dictionary<String,String>> = [
        [
            "itemTitle":"Scroll",
            "itemDescription":"UIScrollViewの可変タイプ",
            "itemPrefix":"Scroll"
        ],
        [
            "itemTitle":"FontDescriptor",
            "itemDescription":"UIFontDescriptorを使った動的なFont属性の変更",
            "itemPrefix":"FontDescriptor"
        ],
        [
            "itemTitle":"FontName",
            "itemDescription":"iOSに入っているFontの一覧とその見え方",
            "itemPrefix":"FontName"
        ],
        [
            "itemTitle":"Gesture",
            "itemDescription":"GestureRecognizerのテスト",
            "itemPrefix":"Gesture"
        ]
    ]
    

    
    var currentClassName:String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(NSStringFromClass(self.dynamicType))

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
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let info = self.items[indexPath.row]
        cell.textLabel!.text = info["itemTitle"]!
        cell.detailTextLabel!.text = info["itemDescription"]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let info = self.items[indexPath.row]
        
        //@see http://okenprog.hatenablog.com/entry/2015/03/28/015710
        var className = info["itemPrefix"]! + "ViewController"
        var name = ""
        var myAppName:String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String
        
        //どうやらbundlenameの-は_に置き換えられてしまうらしい
        myAppName = myAppName.stringByReplacingOccurrencesOfString("-", withString: "_", options: nil, range: nil)
        let viewControllerClass: AnyClass! = NSClassFromString(myAppName+"."+className)
        
        //Type型とAnyClass型の違いがよくわからん・・・
        let objType:UIViewController.Type = viewControllerClass as! UIViewController.Type
        let view = objType(nibName: className, bundle: nil)

        view.navigationItem.title = info["itemTitle"]
        
        currentClassName = className
        
        var barButtonItem = UIBarButtonItem(title: "CODE", style: UIBarButtonItemStyle.Plain, target: self, action: "codeButtonTapped:")
        view.navigationItem.rightBarButtonItem = barButtonItem
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func codeButtonTapped(sender:UIButton){
        var str = "https://github.com/t2421/iOS-snipet/blob/master/iOS-snipets/" + self.currentClassName + ".swift"
        var codeView = BrowseCodeViewController(nibName: "BrowseCodeViewController", bundle: nil)
       // var codeView = BrowseCodeViewController(nibName: "BrowseCodeViewController", bundle: true)
        codeView.urlString = str
        codeView.navigationItem.title = self.currentClassName
        self.navigationController?.pushViewController(codeView, animated: true)
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
