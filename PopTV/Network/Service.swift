//
//  Service.swift
//  PopTV
//
//  Created by Gülenay Gül on 14.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import Alamofire

final class Service {
    
    static func getModel<T: Codable>(urlRequest: URLRequest, completion: @escaping (T?) -> Void) {
        Alamofire.request(urlRequest).responseJSON { (response) -> Void in
            if response.result.isFailure {
                completion(nil)
            } else {
                guard let data = response.data, let model: T = data.decode() else{
                    completion(nil)
                    return
                }
                completion(model)
            }
        }
    }
    
    static func getURLRequest(requestType: Router) -> URLRequest? {
        return try? requestType.asURLRequest()
    }
    
}

