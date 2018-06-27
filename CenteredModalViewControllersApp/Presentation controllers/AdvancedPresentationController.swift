//
//  AdvancedPresentationController.swift
//  ActivityIndicatorApp
//
//  Created by Imanou on 15/06/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class AdvancedPresentationController: UIPresentationController {
    
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
    
    // if preferredContentSizeDidChange(forChildContentContainer:) is implemented, this method will be called several times to reflect the new size
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return container.preferredContentSize
    }
    
    public override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        //super.preferredContentSizeDidChange(forChildContentContainer: container)
        self.containerView?.setNeedsLayout()
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
     override func shouldPresentInFullscreen() -> Bool {
     return true // default
     }
     */
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        // If the presentation didn't complete, remove the dimming view
        // From Apple documentation (Adding Custom Views to a Presentation)
        if !completed {
            self.dimmingView.removeFromSuperview()
        }
    }
    
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
