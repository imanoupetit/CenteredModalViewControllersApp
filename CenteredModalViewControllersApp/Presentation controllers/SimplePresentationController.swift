//
//  SimplePresentationController.swift
//  ActivityIndicatorApp
//
//  Created by Imanou on 13/06/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class SimplePresentationController: UIPresentationController {
    
    let dimmingView = UIView()

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let containerBounds = containerView!.bounds
        var presentedViewFrame = CGRect.zero
        
        presentedViewFrame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerBounds.size)
        presentedViewFrame.origin = CGPoint(x: (containerBounds.size.width - presentedViewFrame.size.width) / 2, y: (containerBounds.size.height - presentedViewFrame.size.height) / 2)
        return presentedViewFrame
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return container.preferredContentSize
    }
    
    override func containerViewWillLayoutSubviews() {
        dimmingView.frame = containerView!.bounds
        presentedView?.frame = frameOfPresentedViewInContainerView
    }

    /*
    override var adaptivePresentationStyle: UIModalPresentationStyle {
        // When we adapt to a compact width environment, we want to be over full screen
        return .OverFullScreen // .Custom // .FullScreen
    }
    */
    
    /*
    override func presentationTransitionDidEnd(completed: Bool)  {
        // If the presentation didn't complete, remove the dimming view
        if !completed {
            self.dimmingView.removeFromSuperview()
        }
    }
    */
    
    /*
    override func shouldPresentInFullscreen() -> Bool {
        return true // default
    }
    */
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        dimmingView.alpha = 0
        containerView?.addSubview(dimmingView)
        
        (presentingViewController as? UINavigationController)?.navigationBar.tintAdjustmentMode = UIViewTintAdjustmentMode.dimmed

        let transition: (UIViewControllerTransitionCoordinatorContext) -> Void = { _ in
            self.dimmingView.alpha = 1
        }
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: transition, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        (presentingViewController as? UINavigationController)?.navigationBar.tintAdjustmentMode = UIViewTintAdjustmentMode.normal

        let transition: (UIViewControllerTransitionCoordinatorContext) -> Void = { _ in
            self.dimmingView.alpha = 0
        }
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: transition, completion: nil)
    }
    
}
