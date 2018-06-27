//
//  IconMenuViewController.swift
//  ActivityIndicatorApp
//
//  Created by Imanou on 13/06/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

struct Model {
    let iconName: String
    let title: String
}

class MenuViewController: UITableViewController {
    
    let models = [Model(iconName: "Icon 1", title: "Item #1"), Model(iconName: "Icon 2", title: "Item #2") , Model(iconName: "Icon 1", title: "Item #3")]
    var observation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        
        tableView.isScrollEnabled = false
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.Constant.identifier)
        
        observation = tableView.observe(\.contentSize, options: [.new], changeHandler: { [unowned self] (tableView, contenSizeChange) in
            guard let contenSize = contenSizeChange.newValue else { return }
            self.preferredContentSize = CGSize(width: 350, height: contenSize.height)
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.Constant.identifier, for: indexPath) as! MenuCell
        let model = models[indexPath.row]
        cell.nameLabel.text = model.title
        cell.iconView.image = UIImage(named: model.iconName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
    }
    
}
