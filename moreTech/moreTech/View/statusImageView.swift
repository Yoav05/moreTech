//
//  statusImageView.swift
//  moreTech
//
//  Created by Yoav on 14/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import UIKit

class statusImageView: UIImageView {
    
    func addStatus(status: Bool) {
        if (status) {
            self.image = #imageLiteral(resourceName: "statusTrue")
        } else {
            self.image = #imageLiteral(resourceName: "statusFalse")
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
