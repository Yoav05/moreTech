//
//  APIResponse.swift
//  moreTech
//
//  Created by Gagik on 14/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import Foundation

struct EventResponse {
    let id: String
    let amount: String
    let date: String
    let name: String
    let state: String
}

extension EventResponse: Decodable {
    
    private enum ApiResponseCodingKeys: String, CodingKey {
        case id = "Id"
        case amount = "Amount"
        case date = "Date"
        case name = "Name"
        case state = "State"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ApiResponseCodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        amount = try container.decode(String.self, forKey: .amount)
        date = try container.decode(String.self, forKey: .date)
        name = try container.decode(String.self, forKey: .name)
        state = try container.decode(String.self, forKey: .state)
        
    }
}


struct ParticipantResponse {
    let id: String
    let amount: Float
    let invoice: Int
    let state: String
}

extension ParticipantResponse: Decodable {
    
    private enum ApiResponseCodingKeys: String, CodingKey {
        case id = "id"
        case amount = "amount"
        case invoice = "invoice"
        case state = "state"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ApiResponseCodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        amount = try container.decode(Float.self, forKey: .amount)
        invoice = try container.decode(Int.self, forKey: .invoice)
        state = try container.decode(String.self, forKey: .state)
        
    }
}
