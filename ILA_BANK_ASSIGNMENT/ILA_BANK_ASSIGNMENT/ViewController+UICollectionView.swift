//
//  File.swift
//  ILA_BANK_ASSIGNMENT
//
//  Created by Guna  Maddali on 20/02/24.
//

import UIKit

protocol CollectionViewDelegate: AnyObject {
    func didSelectItem(at index: Int)
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carouselView", for: indexPath) as! CarouselImageViewCollectionViewCell
        cell.configureCell(image: images[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.visibleSize
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(at: indexPath.item)
    }




}
