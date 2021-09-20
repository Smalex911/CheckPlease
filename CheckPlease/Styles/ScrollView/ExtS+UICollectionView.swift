//
//  ExtS+UICollectionView.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 18.05.2021.
//

import UIKit

extension UICollectionView {
    
    override func styleClear() {
        styleClear(contentInset: .zero, minimumInteritemSpacing: 0, direction: .vertical)
    }
    
    func styleClear(contentInset: UIEdgeInsets = .zero, minimumInteritemSpacing: CGFloat = 0, direction: UICollectionView.ScrollDirection = .vertical) {
        super.styleClear()
        
        alwaysBounceVertical = direction == .vertical
        
        self.contentInset = contentInset
        scrollIndicatorInsets = contentInset
        
        let lay = (collectionViewLayout as? UICollectionViewFlowLayout) ?? UICollectionViewFlowLayout()
        
        lay.scrollDirection = direction
        lay.minimumInteritemSpacing = minimumInteritemSpacing
        lay.minimumLineSpacing = 0
        collectionViewLayout = lay
    }
}
