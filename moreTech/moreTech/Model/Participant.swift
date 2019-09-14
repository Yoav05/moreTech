//
//  Participant.swift
//  moreTech
//
//  Created by Yoav on 14/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import Foundation


class Participants {
    private(set) var idEvent: String!
    private(set) var amountMoney: Double!
    private(set) var numberKey: String!
    
    init(idEvent: String, amountMoney: Double, numberKey: String) {
        self.idEvent = idEvent
        self.amountMoney = amountMoney
        self.numberKey = numberKey
    }
}
