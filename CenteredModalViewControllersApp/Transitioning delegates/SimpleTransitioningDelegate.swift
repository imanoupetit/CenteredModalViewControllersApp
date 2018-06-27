//
//  SimpleTransitioningDelegate.swift
//  ActivityIndicatorApp
//
//  Created by Imanou on 13/06/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class SimpleTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
        
    // Only needed if PresentationController is implemented (ie if presentation is not fullScreen?)
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return SimplePresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animationController = TransitionAnimator()
        return animationController
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animationController = TransitionAnimator()
        animationController.isPresentation = false
        return animationController
    }
    
}
