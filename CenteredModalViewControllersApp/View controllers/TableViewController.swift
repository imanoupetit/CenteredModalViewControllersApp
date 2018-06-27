//
//  TableViewController.swift
//  ActivityIndicatorApp
//
//  Created by Imanou on 15/06/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let simpleTransitioningDelegate = SimpleTransitioningDelegate()
    let advancedTransitioningDelegate = AdvancedTransitioningDelegate()

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:     showLoadingViewController()
        case 1:     showMenuViewController()
        default:    break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func showLoadingViewController() {
        let controller = ActivityIndicatorViewController()
        controller.transitioningDelegate = simpleTransitioningDelegate
        controller.modalPresentationStyle = .custom
        
        present(controller, animated: true, completion: nil)
        
        let delay = DispatchTime.now() + DispatchTimeInterval.seconds(3)
        DispatchQueue.main.asyncAfter(deadline: delay) {
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }

    func showMenuViewController() {
        let controller = MenuViewController()
        controller.transitioningDelegate = advancedTransitioningDelegate
        controller.modalPresentationStyle = .custom
        present(controller, animated: true, completion: nil)
    }
    
}
