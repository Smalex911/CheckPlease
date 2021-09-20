//
//  SwipeCCM.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 17.05.2021.
//

import UIKit
import SwipeCellKit
import ViDataAdapter

public protocol ISwipeCellModel: ICollectionCellModel {
    var delegate: SwipeCollectionViewCellDelegate? { get set }
    var didRemove: ((_ entity: Any?, _ indexPath: IndexPath) -> Void)? { get set }
}

public struct SwipeCCM<T: SwipeCollectionViewCell & IEntityView>: ISwipeCellModel {
    
    public var lineSpacing: CGFloat?
    public var interitemSpacing: CGFloat?
    public var insetSection: UIEdgeInsets?
    
    weak public var delegate: SwipeCollectionViewCellDelegate?
    public var didRemove: ((_ entity: Any?, _ indexPath: IndexPath) -> Void)?
    
    public func register(in collectionView: UICollectionView) {
        collectionView.register(T.self)
    }
    
    public func cell(for entity: Any?, in collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeue(for: indexPath) as T
        cell.delegate = delegate
        cell.entity = entity as? T.E
        
        return cell
    }
    
    public func size(for entity: Any?, in collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, at indexPath: IndexPath) -> CGSize {
        
        T.size(for: entity as? T.E, in: collectionView) ?? .zero
    }
}
