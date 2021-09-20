//
//  PositionCell.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 17.05.2021.
//  
//

import UIKit
import ViGenericCells
import ViDataAdapter
import SwipeCellKit

class PositionCell: SwipeCollectionViewCell, IEntityView {
    
    @IBOutlet weak var viewContainer: TapScaleView!
    @IBOutlet weak var labelAmount: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var collectionViewParticipants: UICollectionView!
    
    //MARK: -
    
    var entity: Position? {
        didSet {
            updateUI()
        }
    }
    
    static func size(for entity: Position?, in scrollView: UIScrollView) -> CGSize? {
        .init(width: scrollView.bounds.width - 10 * 2, height: 97)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        specialBadgesSetupModel?.reload()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        style()
    }
    
    func style() {
        backgroundColor = .clear
        styleShadowCard()
        
        viewContainer.backgroundColor = .backgroundCard
        viewContainer.styleRounded(cornerRadius: 20)
        viewContainer.touchAreaPadding = .init(padding: 5)
        
        collectionViewParticipants.styleClear()
        collectionViewParticipants.isUserInteractionEnabled = false
        
        labelAmount.attributedText = nil
        labelName.style(font: UIFont.Style.system.font(ofSize: 16, weight: .light), color: .text, alignment: .right, lines: .many)
    }
    
    func updateUI() {
        if let fullAmount = TextProvider.priceFormat(entity?.amount) {
            let intAmount = String(fullAmount.split(separator: ",").first ?? "")
            
            labelAmount.styleAttr(.init(text: "\(fullAmount) \(TextProvider.rub)", color: .text, font: .amountFractions), subAttr: [.init(text: intAmount, font: .amountInt), .init(text: TextProvider.rub, font: .amountRub)], lines: .one)
        } else {
            labelAmount.text = nil
        }
        
        labelName.text = entity?.name
    }
}
