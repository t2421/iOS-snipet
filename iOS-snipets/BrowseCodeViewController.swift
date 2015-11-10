//
//  BrowseCodeViewController.swift
//  iOS-snipets
//
//  Created by taigakiyotaki on 2015/07/28.
//  Copyright (c) 2015年 taigakiyotaki. All rights reserved.
//

import UIKit
import SVProgressHUD
class BrowseCodeViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webview: UIWebView!
    var urlString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webview.delegate = self
        startLoad()
        SVProgressHUD.showWithStatus("loading..." ,maskType: SVProgressHUDMaskType.Gradient)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func startLoad(){
        SVProgressHUD.show()
        if((self.urlString) == nil){
            return;
        }
        
        print("start")
        
        let url = NSURL(string: self.urlString!)
        let request = NSURLRequest(URL: url!)
        self.webview.loadRequest(request)
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        SVProgressHUD.dismiss()
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
