//
//  SocketioViewController.swift
//  iOS-snipets
//
//  Created by taigakiyotaki on 2015/11/10.
//  Copyright © 2015年 taigakiyotaki. All rights reserved.
//

import UIKit
import Socket_IO_Client_Swift

class SocketioViewController: UIViewController {
    
    //ここでインスタンスを生成すると上手くいかない。
    var socket:SocketIOClient!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ここでインスタンスを生成してsocket通信する
        socket = SocketIOClient(socketURL: "localhost:4567", options: [.Log(true), .ForcePolling(true)])
        socket.on("from_client") { data in
            print(data)
        }
        socket.on("disconnect") { data in
            print("socket disconnected!!")
        }
        print(socket)
        socket.connect()        // Do any additional setup after loading the view.
        print("wao!")
        
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
