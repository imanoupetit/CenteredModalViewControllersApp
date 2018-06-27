//
//  TransitionAnimator.swift
//  ActivityIndicatorApp
//
//  Created by Imanou on 13/06/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresentation = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.7
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // Set view hierarchy
        
        let containerView = transitionContext.containerView
        let transitionView: UIView
        if isPresentation {
            transitionView = transitionContext.view(forKey: .to)!
            containerView.addSubview(transitionView)
        } else {
            transitionView = transitionContext.view(forKey: .from)!
        }

        // Transform
        
        let startTransform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        let endTransform = CGAffineTransform.identity
        transitionView.transform = isPresentation ? startTransform : endTransform
        
        // Set animation
        
        let duration = transitionDuration(using: transitionContext)
        let delay: TimeInterval = 0
        let damping: CGFloat = 30
        let initialVelocity: CGFloat = 5
        let options: UIViewAnimationOptions = .curveEaseOut
        let animations: () -> Void = {
            if self.isPresentation {
                transitionView.transform = endTransform
            } else {
                transitionView.alpha = 0
                transitionView.transform = startTransform
            }
        }
        let completion: (Bool) -> Void = { bool in
            if !self.isPresentation { transitionView.removeFromSuperview() }
            transitionContext.completeTransition(bool)
        }
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: initialVelocity, options: options, animations: animations, completion: completion)
    }

}
