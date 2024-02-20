//
//  ItemsTableViewCell.swift
//  ILA_BANK_ASSIGNMENT
//
//  Created by Guna  Maddali on 20/02/24.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {

    private lazy var itemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        // Initialization code
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewHeirarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(image: UIImage, name: String) {
        itemImage.image = image
        itemNameLabel.text = name
    }

    private func setupViewHeirarchy() {
        addSubview(itemImage)
        addSubview(itemNameLabel)
    }

    private func setupConstraints() {
        var constraints: [NSLayoutConstraint] = []

        constraints.append(itemImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8))
        constraints.append(itemImage.centerYAnchor.constraint(equalTo: centerYAnchor))
        constraints.append(itemImage.widthAnchor.constraint(equalToConstant: 60))
        constraints.append(itemImage.heightAnchor.constraint(equalToConstant: 40))

        constraints.append(itemNameLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 8))
        constraints.append(itemNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor))
        constraints.append(itemNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8))

        NSLayoutConstraint.activate(constraints)
    }


}
