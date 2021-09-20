//
//  MainVC.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//  

import UIKit
import ViDataAdapter

protocol MainDisplayLogic: AnyObject {
    
    func updatePositions(_ positions: [Position]?)
}

class MainVC: BaseViewController {
    
    @IBOutlet weak var viewParticipantsContainer: UIView!
    @IBOutlet weak var labelParticipants: UILabel!
    @IBOutlet weak var collectionViewParticipants: UICollectionView!
    
    @IBOutlet weak var collectionViewPositions: UICollectionView!
    
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var labelAmountTitle: UILabel!
    @IBOutlet weak var labelAmount: UILabel!
    @IBOutlet weak var buttonAction: ExtendedHitButton!
    
    var interactor: MainBusinessLogic?
    var router: MainRoutingLogic?
    
    var sectionProvider: ViData.Collection.GSectionProvider<SwipeSectionData>!
    var adapter: ViData.Collection.GAdapter<ViData.Collection.GSectionProvider<SwipeSectionData>>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionProvider = .init(collectionViewPositions)
        adapter = .init(collectionViewPositions, sectionsProvider: sectionProvider)
        
        var model = SwipeCCM<PositionCell>(lineSpacing: 10, interitemSpacing: 10)
        model.didRemove = { (entity, indexPath) in
            
        }
        sectionProvider.add(.init(id: ViData.SingleSection.single, cellModel: model))
        
        interactor?.fetchPositions()
    }
    
    override func style() {
        super.style()
        
        collectionViewPositions.styleClear()
    }
    
    override func fill() {
        super.fill()
        
    }
}

extension MainVC: MainDisplayLogic {
    
    func updatePositions(_ positions: [Position]?) {
        sectionProvider?.update(ViData.SingleSection.single, cells: positions)
        sectionProvider?.reload()
    }
}
