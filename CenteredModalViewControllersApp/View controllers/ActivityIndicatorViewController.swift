//
//  ActivityIndicatorViewController.swift
//  ActivityIndicatorApp
//
//  Created by Imanou on 13/06/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class ActivityIndicatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferredContentSize = CGSize(width: 80, height: 80)
        
        // activityView
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityView.color = .gray
        activityView.startAnimating()
        
        // blurView
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
        blurView.layer.cornerRadius = 12
        blurView.layer.masksToBounds = true
        blurView.contentView.addSubview(activityView)

        // View
        view.backgroundColor = UIColor.clear
        view.addSubview(blurView)
        
        // Shadow
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 6
        
        // Auto layout
        blurView.translatesAutoresizingMaskIntoConstraints = false
        activityView.translatesAutoresizingMaskIntoConstraints = false
        let metrics = ["width": preferredContentSize.width, "height": preferredContentSize.height]
        let viewsDictionary: [String: UIView] = ["view": view, "blurView": blurView, "activityView": activityView]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[view]-(<=0)-[blurView(width)]", options: .alignAllCenterY, metrics: metrics, views: viewsDictionary))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[view]-(<=0)-[blurView(height)]", options: .alignAllCenterX, metrics: metrics, views: viewsDictionary))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[blurView]-(<=0)-[activityView]", options: .alignAllCenterY, metrics: nil, views: viewsDictionary))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[blurView]-(<=0)-[activityView]", options: .alignAllCenterX, metrics: nil, views: viewsDictionary))
    }
    
}
