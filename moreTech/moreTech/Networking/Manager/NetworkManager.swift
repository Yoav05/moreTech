//
//  NetworkManager.swift
//  moreTech
//
//  Created by Gagik on 14/09/2019.
//  Copyright © 2019 Yoav. All rights reserved.
//

import Foundation

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}

struct NetworkManager {
    static let MovieAPIKey = ""
    let router = Router<API>()
    
    func registrate(id: String, completion: @escaping (_ id: String?,_ error: String?)->()){
        router.request(.registrate(id: id)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            if let response = response as? HTTPURLResponse{
                if response.statusCode != 200 {
                    completion (nil, "Bad request")
                }
                do{
                    guard let responseData = data else {
                        completion (nil, "Bad response")
                        return
                    }
                    let apiResponse = try JSONDecoder().decode(ParticipantResponse.self, from: responseData)
                    completion(apiResponse.id, nil)
                }catch{}
            }
        }
    }
    
    func createEvent(event: EventResponse, completion: @escaping (_ id: String?,_ error: String?)->()){
        router.request(.createEvent(id: event.id, amount: event.amount, name: event.name, date: event.date)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            if let response = response as? HTTPURLResponse{
                if response.statusCode != 200 {
                    completion (nil, "Bad request")
                }
                do{
                    guard let responseData = data else {
                        completion (nil, "Bad response")
                        return
                    }
                    let apiResponse = try JSONDecoder().decode(EventResponse.self, from: responseData)
                    completion(apiResponse.id, nil)
                }catch{}
            }
        }
    }
    
    func getEvents(id: String, completion: @escaping (_ event: [EventResponse]?,_ error: String?)->()){
        router.request(.getEvents(id: id)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            if let response = response as? HTTPURLResponse{
                if response.statusCode != 200 {
                    completion (nil, "Bad request")
                }
                guard let responseData = data else {
                    completion (nil, "Bad response")
                    return
                }
                let apiResponse = try? JSONDecoder().decode([EventResponse].self, from: responseData)
                completion(apiResponse, nil)
            }
        }
    }
    
    func addParticipant(ownerId: String, meetingId: Int, amount: String, invoice: String, completion: @escaping (_ error: String?)->()){
        router.request(.addParticipant(ownerId: ownerId, meetingId: meetingId, amount: amount, invoice: invoice)) { data, response, error in
            if error != nil {
                completion("Please check your network connection.")
            }
            if let response = response as? HTTPURLResponse{
                if response.statusCode != 200 {
                    completion ("Bad request")
                }
                do{
                    guard let responseData = data else {
                        completion ("Bad response")
                        return
                    }
                    let apiResponse = try JSONDecoder().decode(EventResponse.self, from: responseData)
                    completion(nil)
                } catch{}
            }
        }
    }
    
}
