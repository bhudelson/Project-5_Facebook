//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Blake Hudelson on 2/3/16.
//  Copyright © 2016 Blake Hudelson. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var buttonView: UIButton!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 1320)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

//    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//        var destinationViewController = segue.destinationViewController as! PhotoViewController
//        
//        destinationViewController.image = self.imageView.image
//        
//    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("about to transition")
    }


}
