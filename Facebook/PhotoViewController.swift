//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Blake Hudelson on 3/5/16.
//  Copyright © 2016 Blake Hudelson. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var blackBgView: UIView!
    
    var image: UIImage!
    var targetOriginalCenter: CGPoint!
    var photoTransition: PhotoTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imageView.image = image

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissPhoto(sender: AnyObject) {
        
        let seconds = 0.8
        let delay = seconds * Double(NSEC_PER_SEC)
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
        
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })
    }
    
    

    @IBAction func didPanPhoto(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            targetOriginalCenter = imageView.center
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.doneButton.alpha = 0
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            imageView.center = CGPoint(x: targetOriginalCenter.x + translation.x, y: targetOriginalCenter.y + translation.y)
            
            if translation.y > 0 {
                blackBgView.backgroundColor = UIColor(white: 0, alpha: (50 / translation.y))
                print(view.backgroundColor)
            } else if translation.y < 0 {
                blackBgView.backgroundColor = UIColor(white: 0, alpha: (50 / translation.y * -1))
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.doneButton.alpha = 1
            })
            if translation.y > 100 {
                dismissViewControllerAnimated(true, completion: nil)
            } else if translation.y < -100 {
                dismissViewControllerAnimated(true, completion: nil)
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.imageView.center = self.targetOriginalCenter
                    self.view.backgroundColor = UIColor(white: 0, alpha: 1)
                })
            }
            
        }
        
    }

    
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
//    }


}


