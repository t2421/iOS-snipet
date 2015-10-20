//
//  FontNameViewController.swift
//  iOS-snipets
//
//  Created by taigakiyotaki on 2015/07/21.
//  Copyright (c) 2015年 taigakiyotaki. All rights reserved.
// @see https://github.com/shu223/iOS8-Sampler/blob/master/iOS8Sampler/Samples/FontsViewController.m
//

import UIKit

class FontNameViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var fontList:[AnyObject]!;
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontList = UIFont.familyNames();
        print(UIFont.familyNames());
        tableView.delegate = self;
        tableView.dataSource = self;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")

        let fontName = fontList[indexPath.row] as! String;
        let font:UIFont = UIFont(name: fontName, size: 19.0)!;
        cell.textLabel?.font = font;
        cell.textLabel?.text = fontName;
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
