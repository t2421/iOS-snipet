//
//  BrowseCodeViewController.swift
//  iOS-snipets
//
//  Created by taigakiyotaki on 2015/07/28.
//  Copyright (c) 2015年 taigakiyotaki. All rights reserved.
//

import UIKit

class BrowseCodeViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webview: UIWebView!
    var urlString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webview.delegate = self
        startLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func startLoad(){
        
        if((self.urlString) == nil){
            return;
        }
        
        println("start")
        
        var url = NSURL(string: self.urlString!)
        var request = NSURLRequest(URL: url!)
        self.webview.loadRequest(request)
        
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
