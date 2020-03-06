//
//  DropDownCustomCell.swift
//  DropDown
//
//  Created by Ram on 06/03/20.
//  Copyright © 2020 Kevin Hirsch. All rights reserved.
//

import Foundation
open class DropDownCustomCell: DropDownCell {
    open var titleLabel = UILabel(frame: .zero)

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        optionLabel = titleLabel
        addSubviews()
        setupSubviews()
    }
    
    func addSubviews() {
        addSubview(titleLabel)
        // override this method and add any additional fields
    }
    
    func setupSubviews() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
