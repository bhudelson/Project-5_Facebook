//
//  PhotoTransition.swift
//  Facebook
//
//  Created by Blake Hudelson on 3/6/16.
//  Copyright © 2016 Blake Hudelson. All rights reserved.
//

import UIKit

class PhotoTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let movingImageView = UIImageView()
        
        let newsFeedViewController = fromViewController as! NewsFeedViewController
        let photoViewController = toViewController as! PhotoViewController
        let destinationImageFrame = photoViewController.imageView.frame
        
        //Clone the view
        movingImageView.frame = newsFeedViewController.selectedImageView.frame
        movingImageView.image = newsFeedViewController.selectedImageView.image
        movingImageView.clipsToBounds = newsFeedViewController.selectedImageView.clipsToBounds
        movingImageView.contentMode = newsFeedViewController.selectedImageView.contentMode
        
        containerView.addSubview(movingImageView)
        
        //Subtract offset from scrollview
        movingImageView.frame.origin.y -= newsFeedViewController.scrollView.contentOffset.y
        
        //Hide initial and final images
        newsFeedViewController.selectedImageView.hidden = true
        photoViewController.imageView.hidden = true
        
        UIView.animateWithDuration(duration, animations: {
            
            
            photoViewController.imageView.alpha = 1
            movingImageView.frame = destinationImageFrame
            
            //Sets newly created image view frame to the destination frame
            
            }) { (finished: Bool) -> Void in
                
                movingImageView.hidden = true
                photoViewController.imageView.hidden = false
                
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
       
        
        let movingImageView = UIImageView()
        
        //Switch from and to view controllers and the destination image frame to dismiss
        let newsFeedViewController = toViewController as! NewsFeedViewController
        let photoViewController = fromViewController as! PhotoViewController
        var destinationImageFrame = newsFeedViewController.selectedImageView.frame
        
        //Clone the view
        movingImageView.frame = photoViewController.imageView.frame
        movingImageView.image = photoViewController.imageView.image
        movingImageView.clipsToBounds = photoViewController.imageView.clipsToBounds
        movingImageView.contentMode = photoViewController.imageView.contentMode
        
        containerView.addSubview(movingImageView)
        
        //Subtract offset from scrollview
        destinationImageFrame.origin.y -= newsFeedViewController.scrollView.contentOffset.y
        
        //Hide initial and final images
        newsFeedViewController.selectedImageView.hidden = true
        photoViewController.imageView.hidden = true
        
        
        UIView.animateWithDuration(duration, animations: {
            
            movingImageView.frame = destinationImageFrame
            fromViewController.view.alpha = 0
            
            }) { (finished: Bool) -> Void in
                movingImageView.hidden = true
                newsFeedViewController.selectedImageView.hidden = false
                self.finish()
        }
    }

}
