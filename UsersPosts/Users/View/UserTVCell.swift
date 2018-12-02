//
//  UserTVCell.swift
//  UsersPosts
//
//  Created by Andrey Volobuev on 8/7/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import UIKit


class UserTVCell: UITableViewCell, ViewModelConfigurable {
    
    lazy var label1: UILabel = { l in
        return l
    }(UILabel())
    
    lazy var label2: UILabel = { l in
        return l
    }(UILabel())
    
    lazy var label3: UILabel = { l in
        return l
    }(UILabel())
    
    lazy var label4: UILabel = { l in
        l.numberOfLines = 0
        return l
    }(UILabel())
    
    lazy var stackView: UIStackView = { sv in
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillProportionally
        sv.alignment = .fill
        sv.axis = .vertical
        sv.spacing = 8
        return sv
    }(UIStackView(arrangedSubviews: [label1, label2, label3, label4]))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func configure(for viewModel: UserViewModel) {
        label1.text = viewModel.name
        label2.text = viewModel.userName
        label3.text = viewModel.email
        label4.text = viewModel.address
        layoutIfNeeded()
    }

    private func commonInit() {
        accessoryType = .disclosureIndicator
        stackView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        stackView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
