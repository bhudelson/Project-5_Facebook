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
    @IBOutlet weak var feedImage: UIImageView!
    
    var selectedImageView: UIImageView!
    
    var photoTransition: PhotoTransition!
    
//    var fadeTransition: FadeTransition!
//    
//    var lightBoxTransition = LightBoxTransition!()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        fadeTransition = FadeTransition()
//        
//        lightBoxTransition = LightBoxTransition ()
        
        scrollView.contentSize = CGSize(width: 320, height: 1320)

        photoTransition = PhotoTransition()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapImage(sender: UITapGestureRecognizer) {
        
        selectedImageView = sender.view as! UIImageView
        
        //trigger segue on tap
        performSegueWithIdentifier("photoSegue", sender: nil)
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let photoViewController = segue.destinationViewController as! PhotoViewController
        
        //Trigger custom transition
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        photoViewController.transitioningDelegate = photoTransition
        
        photoTransition.duration = 0.3
        
        photoViewController.view.layoutIfNeeded()
        
        
        photoViewController.imageView.image = selectedImageView.image

        

        
        print("about to transition")
    }


}
