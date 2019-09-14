//
//  APIResponse.swift
//  moreTech
//
//  Created by Gagik on 14/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import Foundation

struct ApiResponse {
    let id: String
    let amount: Float
    let invoice: Int
    let state: String
}

extension ApiResponse: Decodable {
    
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
