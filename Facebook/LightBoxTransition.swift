//
//  LightBoxTransition.swift
//  Facebook
//
//  Created by Blake Hudelson on 3/5/16.
//  Copyright © 2016 Blake Hudelson. All rights reserved.
//

import UIKit

class LightBoxTransition: BaseTransition {
    
    var blackView = UIView()
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        blackView = UIView()
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.8)
        blackView.frame = fromViewController.view.frame
        blackView.alpha = 0
        
        fromViewController.view.addSubview(blackView)
        
        toViewController.view.alpha = 0
        toViewController.view.transform = CGAffineTransformMakeScale(0, 0)
        
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            toViewController.view.transform = CGAffineTransformMakeScale(1, 1)
            self.blackView.alpha = 1
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        blackView.removeFromSuperview()
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            fromViewController.view.transform = CGAffineTransformMakeScale(0.001, 0.001)
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }

}
