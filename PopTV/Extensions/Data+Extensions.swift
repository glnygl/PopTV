//
//  Data+Extensions.swift
//  PopTV
//
//  Created by Gülenay Gül on 14.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import Foundation

extension Data{
    
    func decode<T: Codable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
    
}

