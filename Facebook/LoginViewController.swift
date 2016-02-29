//
//  LoginViewController.swift
//  Facebook
//
//  Created by Blake Hudelson on 2/10/16.
//  Copyright © 2016 Blake Hudelson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var labelParentView: UIView!
    @IBOutlet weak var logoParentView: UIView!
    @IBOutlet weak var fieldParentView: UIView!
    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    @IBAction func onButton(sender: AnyObject) {
        delay(2) {
//            self.checkPassword()
        }
    }
    
    var fieldInitialY: CGFloat!
    var fieldOffset: CGFloat!
    
    var logoInitialY: CGFloat!
    var logoOffset: CGFloat!
    
    var labelInitialY: CGFloat!
    var labelOffset: CGFloat!
    
    func keyboardWillShow(notification: NSNotification!) {
        logoParentView.frame.origin.y = logoInitialY + logoOffset
        fieldParentView.frame.origin.y = fieldInitialY + fieldOffset
        labelParentView.frame.origin.y = labelInitialY + labelOffset
        
    }
    
    
    //        func keyboardWillShow(notification: NSNotification!) {
    //            fieldParentView.frame.origin.y = fieldInitialY + fieldOffset
    //        }
    
    //            func keyboardWillShow(notification: NSNotification!) {
    //                labelParentView.frame.origin.y = labelInitialY + labelOffset
    //
    //            }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldParentView.frame.origin.y = fieldInitialY
    }
    
    //                func keyboardWillHide(notification: NSNotification!) {
    //                    labelParentView.frame.origin.y = labelInitialY
    //    }
    
    //                    func keyboardWillHide(notification: NSNotification!) {
    //                        logoParentView.frame.origin.y = logoInitialY
    //
    //
    //
    //                    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fieldInitialY = fieldParentView.frame.origin.y
        fieldOffset = -70
        
        logoInitialY = logoParentView.frame.origin.y
        logoOffset = -50
        
        labelInitialY = labelParentView.frame.origin.y
        labelOffset = -160
        
        
        
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    // Delay for 2 seconds, then run the code between the braces.
    func testFunction() {
        print("You ran my function")
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
