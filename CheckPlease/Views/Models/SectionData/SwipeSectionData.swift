//
//  SwipeSectionData.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 17.05.2021.
//

import UIKit
import SwipeCellKit
import ViDataAdapter

public class SwipeSectionData: ViData.Collection.SectionData {
    
    public override var cellModel: ICollectionCellModel? {
        get { _cellModel ?? swipeCellModel }
        set {
            if let cm = newValue as? ISwipeCellModel {
                swipeCellModel = cm
            } else {
                _cellModel = newValue
            }
        }
    }
    
    private var _cellModel: ICollectionCellModel?
    public var swipeCellModel: ISwipeCellModel? {
        didSet {
            swipeCellModel?.delegate = self
        }
    }
    
    public override init(id: ISectionId, headerModel: ICollectionHeaderModel? = nil, cellModel: ICollectionCellModel? = nil, footerModel: ICollectionFooterModel? = nil, header: Any? = nil, cells: [Any?]? = nil, footer: Any? = nil) {
        super.init(id: id, headerModel: headerModel, cellModel: cellModel, footerModel: footerModel, header: header, cells: cells, footer: footer)
        
        self.cellModel = cellModel
    }
}

extension SwipeSectionData: SwipeCollectionViewCellDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let delete = SwipeAction(style: .destructive, title: nil) { [weak self] action, indexPath in
            guard let `self` = self, let entity = self.cells?[indexPath.row] else { return }
            self.cells?.remove(at: indexPath.row)
            self.swipeCellModel?.didRemove?(entity, indexPath)
        }
        configure(action: delete)

        return [delete]
    }
    
    public func collectionView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        
        var options = SwipeOptions()
        options.backgroundColor = .clear
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        options.buttonSpacing = 4
//        options.buttonPadding = -20

        return options
    }
    
    func configure(action: SwipeAction) {
        action.image = UIImage.origImg("trash")
        
        action.backgroundColor = .clear
        action.transitionDelegate = ScaleTransition.default
    }
}
