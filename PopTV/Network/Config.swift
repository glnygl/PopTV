//
//  Config.swift
//  PopTV
//
//  Created by Gülenay Gül on 14.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import Alamofire

struct Keys {
    static let baseURL = "https://api.themoviedb.org"
    static let key = "5de58c29dc743961610d523c39a0955d"
    static let api = "api_key"
}

enum Router: URLRequestConvertible {
    
    case PopulerList
    
    private var method: HTTPMethod {
        switch self {
        case .PopulerList:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .PopulerList:
            return "/3/tv/popular"
        }
    }
    
    private var query: String? {
        switch self {
        case .PopulerList:
            return nil
        }
    }
    
    private var params: Parameters? {
        switch self {
        case .PopulerList:
            return nil
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        
        var components = URLComponents(string: Keys.baseURL)!
        components.queryItems = [
            URLQueryItem(name: Keys.api, value: Keys.key)
        ]

        var url = try components.asURL()
        url.appendPathComponent(path)
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        if let parameters = params {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
