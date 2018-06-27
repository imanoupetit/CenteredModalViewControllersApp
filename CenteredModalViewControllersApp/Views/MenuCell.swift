//
//  MenuCell.swift
//  ActivityIndicatorApp
//
//  Created by Imanou on 14/06/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    struct Constant {
        static let identifier = "MoreMenuCell"
        static let width: CGFloat = 40
    }

    let iconView = UIImageView()
    let nameLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconView.contentMode = .scaleAspectFit

        let stackView = UIStackView(arrangedSubviews: [iconView, nameLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        contentView.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layoutMarginsGuide.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        contentView.layoutMarginsGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        contentView.layoutMarginsGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        contentView.layoutMarginsGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: Constant.width).isActive = true
        let iconHeightConstraint = iconView.heightAnchor.constraint(equalToConstant: Constant.width)
        iconHeightConstraint.priority = UILayoutPriority.defaultHigh
        iconHeightConstraint.isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

