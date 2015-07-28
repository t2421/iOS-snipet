//
//  ScrollViewController.swift
//  iOS-snipets
//
//  Created by taigakiyotaki on 2015/07/14.
//  Copyright (c) 2015年 taigakiyotaki. All rights reserved.
//

//@see http://hamasyou.com/blog/2014/10/09/ios-autolayout-scrollview-tablecell/
//@see http://qiitarou.nago.nagoya/d/ios/738f894447e4cb964183.html
// autolayoutを使って実現しようとしたが、挙動がわからなかったためプログラムでのレイアウトをした。
import UIKit

class ScrollViewController: UIViewController,UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var label:UILabel!
    var contentsMargin:CGFloat = 20.0
    var containerView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.frame.sizeの値は使えない
        var screenW = UIScreen.mainScreen().bounds.size.width
        var screenH = UIScreen.mainScreen().bounds.size.height
        
        //storyboardで配置されているものはここでは幅が設定できない
        //すべてプログラムでレイアウト
        label = UILabel()
        label.text = "どうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入\nっているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキ\nストが入っている¥/どうかテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っているどうかんがえてもおさまりきらないテキストが入っている¥/どうかんがえてもおさまりきらないテキストが入っている"
        
        label.frame.origin = CGPoint(x: contentsMargin, y: contentsMargin)
        label.frame.size = CGSize(width: screenW-contentsMargin, height: 0)
        label.numberOfLines = 0
        label.sizeToFit()
        
        scrollView = UIScrollView()
        scrollView.frame.origin = CGPoint(x: 0, y: 0)
        scrollView.frame.size = CGSize(width: screenW, height: screenH)
        scrollView.backgroundColor = UIColor.blackColor()
        self.view.addSubview(scrollView)
        
        containerView = UIView()
        containerView.frame.origin = CGPoint(x: 0, y: 0)
        
        containerView.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(label)
        var containerSize = resizeToFitSubviews()
        containerSize.height += contentsMargin
        containerView.frame.size = containerSize
        
        scrollView.addSubview(containerView)
        scrollView.contentSize = containerView.frame.size
        
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
    
    //subviewのコンテンツのサイズを解析して親の要素のサイズを計算するよ
    //@see http://stackoverflow.com/questions/3605393/iphone-uiview-resize-frame-to-fit-subviews
    func resizeToFitSubviews()->CGSize{
        var w:CGFloat = 0
        var h:CGFloat = 0
        let subViews = containerView.subviews
        for view in subViews{
            var frameWidth = view.frame.origin.x + view.frame.size.width
            var frameHeight = view.frame.origin.y + view.frame.size.height
            w = max(frameWidth, w)
            h = max(frameHeight,h)
            
        }
        return CGSize(width: w, height: h)
    }
}
