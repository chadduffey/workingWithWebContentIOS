//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Chad Duffey on 10/04/2015.
//  Copyright (c) 2015 Chad Duffey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var newWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.stackoverflow.com")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!){
            (data,response,error) in
            
            if error == nil {
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                //added this later to deal with asyncronus nature of the call. This says stop waiting
                //and do immediately. This reduces delays in HTML handling for us. 
                dispatch_async(dispatch_get_main_queue()){
                    
                    //this was the orginal display to the page, without async handling
                    self.newWebView.loadHTMLString(urlContent, baseURL: nil)
                }
                
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

