//
//  File.swift
//  moreTech
//
//  Created by Yoav on 14/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import Foundation

class Event {
    private(set) var idOwner: String!
    private(set) var amountMoney: Double!
    private(set) var payStatus: Bool!
    
    init(idOwner: String, amountMoney: Double, payStatus: Bool) {
        self.idOwner = idOwner
        self.amountMoney = amountMoney
        self.payStatus = payStatus
    }
    
    func statusOK() {
        payStatus = true
    }
}
