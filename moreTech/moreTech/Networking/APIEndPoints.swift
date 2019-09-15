//
//  APIEndPoints.swift
//  moreTech
//
//  Created by Gagik on 14/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import Foundation

public enum API {
    case registrate(id: String)
    case createEvent(id: String, amount: String, name: String, date: String)
    case getEvents(id: String)
    case addParticipant(ownerId: String, meetingId: Int, amount: String, invoice: String)
    case getParticipants(ownerId: String, meetingId: Int)
    case createInvoice
//    case addParticipant
}

extension API: EndPointType {
    
    var baseURL: URL {
        return URL(string: "http://lb-1836291144.eu-central-1.elb.amazonaws.com")!
    }
    
    var path: String {
        switch self {
        case .registrate:
            return "participants"
        case .createEvent(let id):
            return "participants/\(id)/meetings"
        case .getEvents(let id):
            return "participants/\(id)/meetings"
        case .addParticipant(let ownerId, let meetingId, _, _):
            return "participants/\(ownerId)/meetings/\(meetingId)"
        case .getParticipants(let ownerId, let meetingId):
            return "participants/\(ownerId)/meetings/\(meetingId)"
        case .createInvoice:
            return "invoice"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getEvents, .getParticipants:
            return .get
        case .addParticipant:
            return .put
        default:
            return .post
        }
    }

    
    var task: HTTPTask {
        switch self {
            
        case .registrate(let id):
            return .requestParameters(bodyParameters: ["id":id],
                                      bodyEncoding: .jsonEncoding,
                                      urlParameters: nil)
        case .createEvent(_, let amount, let name, let date):
            return .requestParameters(bodyParameters: ["amount": amount,
                                                       "name": name,
                                                       "date": date],
                                      bodyEncoding: .jsonEncoding,
                                      urlParameters: nil)
        case .addParticipant(_, _, let amount, let invoice):
            return .requestParameters(bodyParameters: ["amount": amount,
                                                       "invoice": invoice],
                                      bodyEncoding: .jsonEncoding,
                                      urlParameters: nil)
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
