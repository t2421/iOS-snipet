//
//  FontDescriptorViewController.swift
//  iOS-snipets
//
//  Created by taigakiyotaki on 2015/07/21.
//  Copyright (c) 2015年 taigakiyotaki. All rights reserved.
//

import UIKit

class FontDescriptorViewController: UIViewController {
    
    var helveticaNeueFamily:UIFontDescriptor!;
    var label:UILabel!;
    var fontSize:CGFloat = 10.0;
    var timer:NSTimer!;
    
    var useFontDescriptor:UIFontDescriptor!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("loop"), userInfo: nil, repeats: true)
        
        label = UILabel();
        label.frame.origin.x = 20;
        label.frame.origin.y = 200;
        label.text = fontSize.description;
        self.view.addSubview(label);

        helveticaNeueFamily = UIFontDescriptor(fontAttributes: [UIFontDescriptorFamilyAttribute:"Helvetica Neue"])
        helveticaNeueFamily =  helveticaNeueFamily.fontDescriptorWithSize(fontSize)
        helveticaNeueFamily = helveticaNeueFamily.fontDescriptorWithSymbolicTraits(UIFontDescriptorSymbolicTraits.TraitBold);
        
        
        //sizeに0.0以外を入れるとそちらのサイズがdescriptorに設定されているサイズより優先される。
        var helveticaBoldFont  = UIFont(descriptor: helveticaNeueFamily, size: 0.0);
        label.font = helveticaBoldFont;
        label.sizeToFit();
        
        timer.fire();
    }
    
    func loop(){
        fontSize += 1.0;
        helveticaNeueFamily =  helveticaNeueFamily.fontDescriptorWithSize(fontSize);
        var helveticaBoldFont  = UIFont(descriptor: helveticaNeueFamily, size: 0.0);
        label.font = helveticaBoldFont;
        label.text = fontSize.description;
        label.sizeToFit();
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidDisappear(animated: Bool) {
        timer.invalidate();
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
