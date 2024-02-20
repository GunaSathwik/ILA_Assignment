//
//  CarouselImageViewCollectionViewCell.swift
//  ILA_BANK_ASSIGNMENT
//
//  Created by Guna  Maddali on 18/02/24.
//

import UIKit

class CarouselImageViewCollectionViewCell: UICollectionViewCell {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.layer.cornerRadius = 16
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Data Binding

    func configureCell(image: UIImage) {
        imageView.image = image
    }

    private func setupUI() {
        addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }


}
