//
//  CustomNavigationController.swift
//  iOS-snipets
//
//  Created by taigakiyotaki on 2015/08/06.
//  Copyright (c) 2015年 taigakiyotaki. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.tintColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0); //barアイテムカラー
        self.navigationBar.barTintColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8); //bar背景カラー
        
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]; //titleカラー
    }
    
    //statusbarの色変更
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
