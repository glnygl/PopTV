//
//  API.swift
//  PopTV
//
//  Created by Gülenay Gül on 14.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import Alamofire

typealias ShowListHandler = ([Show]?) -> Void

final class API {
    
    static func fetchShows(completion: @escaping ShowListHandler) {
        if let urlRequest = Service.getURLRequest(requestType: .PopulerList) {
            Service.getModel(urlRequest: urlRequest) { (result: ShowList?) in
                if let showList = result {
                    completion(showList.results)
                } else {
                    completion(nil)
                }
            }
        }
    }
}
