//
//  GestureViewController.swift
//  iOS-snipets
//
//  Created by taigakiyotaki on 2015/08/12.
//  Copyright (c) 2015年 taigakiyotaki. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
    
    var tapGestureRecognizer:UITapGestureRecognizer!;
    var pinchGestureRecognizer:UIPinchGestureRecognizer!;
    var swipeGestureRecognizer:UISwipeGestureRecognizer!;
    var longPressGestureRecognizer:UISwipeGestureRecognizer!;
    var panGestureRecognizer:UIPanGestureRecognizer!;
    var rotateGestureRecognizer:UIRotationGestureRecognizer!;
    var screenEdgePanGestureRecognizer:UIScreenEdgePanGestureRecognizer!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapGesture:");
        pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: "pinchGesture:");
        
        registerRecognizer();
        // Do any additional setup after loading the view.
    }
    
    func registerRecognizer(){
        self.view.addGestureRecognizer(tapGestureRecognizer);
        self.view.addGestureRecognizer(pinchGestureRecognizer);
    }
    
    func tapGesture(sender:UITapGestureRecognizer){
        println("tapGesture");
        
        //引数のviewを基準とした位置
        println(sender.locationInView(self.view));
    }
    
    func pinchGesture(sender:UIPinchGestureRecognizer){
        println("pinchGesture");
        
        //一定の値が返ってくる？中心？
        println(sender.locationInView(self.view));
        
        //pinchし始めた位置からどれくらいscaleしたかという値が返ってくる
        println("scale--:"+sender.scale.description);
        
        //pinchした速度が返ってくる。１フレーム前との差分？
        println("velocity--:"+sender.velocity.description);
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
