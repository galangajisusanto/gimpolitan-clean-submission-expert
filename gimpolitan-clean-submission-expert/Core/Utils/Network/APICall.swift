//
//  APICall.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 07/11/21.
//

import Foundation

struct API {
    static let baseUrl = "https://api.rawg.io/api/"
    static let key = Bundle.main.infoDictionary?["API_KEY"]  as? String
}

protocol EndPoint {
    var url: String {get}
}

enum Endpoints {
    enum Gets: EndPoint {
        case games
        case gameDetails
        
        public var url: String {
            switch self {
            case .games:
                return "\(API.baseUrl)games"
            case .gameDetails:
                return "\(API.baseUrl)games/"
            }
        }
    }
}
