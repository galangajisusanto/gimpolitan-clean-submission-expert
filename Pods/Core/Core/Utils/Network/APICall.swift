//
//  APICall.swift
//  Core
//
//  Created by Galang Aji Susanto on 20/11/21.
//

public struct API {
    public static let baseUrl = "https://api.rawg.io/api/"
    public static let key = Bundle.main.infoDictionary?["API_KEY"]  as? String
}

public protocol EndPoint {
    var url: String {get}
}

public enum Endpoints {
    public enum Gets: EndPoint {
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
