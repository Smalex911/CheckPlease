//
//  GTCM.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 17.05.2021.
//

import UIKit
import ViDataAdapter
import ViGenericCells

public class GTCM<T: UIView & IEntityView>: IGenericTableCellModel {
    
    typealias Cell = ViGeneric.Table.Cell<T>
    
    private var height: CGFloat?
    
    public init(height: CGFloat? = nil) {
        self.height = height
    }
    
    public func register(in tableView: UITableView) {
        tableView.register(Cell.self)
    }
    
    public func cell(for entity: Any?, in tableView: UITableView, at indexPath: IndexPath) -> (UITableViewCell, Any) {
        
        let cell = tableView.dequeue(for: indexPath) as Cell
        cell.customView.entity = entity as? T.E
        
        return (cell, cell.customView)
    }
    
    public func height(for entity: Any?, in tableView: UITableView, at indexPath: IndexPath) -> CGFloat? {
        height ?? T.size(for: entity as? T.E, in: tableView)?.height
    }
}
