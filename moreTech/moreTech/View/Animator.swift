//
//  Animator.swift
//  moreTech
//
//  Created by Yoav on 15/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import Foundation


final class Animator {
    
    private var hasAnimatedAllCells = false
    private let animation: Animation
    
    init(animation: @escaping Animation) {
        self.animation = animation
    }
    
    func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
        guard !hasAnimatedAllCells else {
            return
        }
        
        animation(cell, indexPath, tableView)
        
        hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)
    }
}
