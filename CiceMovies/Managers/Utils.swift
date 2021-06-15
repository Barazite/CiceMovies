//
//  Utils.swift
//  CiceSports
//
//  Created by cice on 26/05/2021.
//

import Foundation

enum ApiError: Error, LocalizedError{
    case unknow, apiError(reason: String)
    var errorDescription: String?{
        switch self {
        case .unknow:
            return "Unknown error"
        case .apiError(let error):
            return error
        }
    }
}


enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum Environment: Int{
    case DEV = 0
    case PRE = 1
    case PRO = 2
}

struct RequestDTO{
    var params: [String: Any]?
    var arrayParams: [[String: Any]]?
    var method: HTTPMethods
    //var urlContext: String
    var endpoint: String
    
    init(params: [String: Any]?, method: HTTPMethods, endpoint: String){
        self.params = params
        self.method = method
        self.endpoint = endpoint
    }
    
    init(arrayParams: [[String: Any]]?, method: HTTPMethods, endpoint: String){
        self.arrayParams = arrayParams
        self.method = method
        self.endpoint = endpoint
    }
}

struct URLEndpoint {
    
    #if DEV
    static let environmentDefault: Environment = Environment.DEV
    #elseif PRE
    static let environmentDefault: Environment = Environment.PRE
    #else
    static let environmentDefault: Environment = Environment.PRO
    #endif
    
    public enum BaseURLContext{
        case backend
        case heroku
    }
    
    
    
    static let baseUrl = "https://rss.itunes.apple.com/api/v1/es/"
    static let endpointMovies = "movies/%@/%@/%@/explicit.json" // "movies/top-movies/all/25/explicit.json"
     
}

extension URLEndpoint{
    static func getUrlBase(urlContext: BaseURLContext) -> String {
        switch urlContext{
        case .backend:
                switch self.environmentDefault {
                case .DEV:
                    return "https://rss.itunes.apple.com/api/v1/es"
                case .PRE:
                    return "https://rss.itunes.apple.com/api/v1/es"
                case .PRO:
                    return "https://rss.itunes.apple.com/api/v1/es"
                }
        case .heroku:
            switch self.environmentDefault {
            case .DEV:
                return "https://rss.itunes.apple.com/api/v1/es"
            case .PRE:
                return "https://rss.itunes.apple.com/api/v1/es"
            case .PRO:
                return "https://rss.itunes.apple.com/api/v1/es"
            }
            }
        }
}
struct AuthHeroku {
    static let authHeroku = "Bearer 123456789"
}


class Utils {
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatt)
        return jsonDecoder
    }()
    
    static let dateFormatt: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()

}
