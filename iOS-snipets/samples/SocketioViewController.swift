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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let socket = SocketIOClient(socketURL: "localhost:4567", options: [.Log(false), .ForcePolling(true)])
        
        socket.on("connect") {data, ack in
            print("socket connected")
            
        }
        
//        socket.on("currentAmount") {data, ack in
//            if let cur = data[0] as? Double {
//                socket.emitWithAck("canUpdate", cur)(timeoutAfter: 0) {data in
//                    socket.emit("update", ["amount": cur + 2.50])
//                }
//                
//                ack?.with("Got your currentAmount", "dude")
//            }
//        }
        
        socket.connect()
        // Do any additional setup after loading the view.
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
