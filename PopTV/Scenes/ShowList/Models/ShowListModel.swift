//
//  ShowListModel.swift
//  PopTV
//
//  Created by Gülenay Gül on 14.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import Foundation

struct ShowList: Codable {
    let page: Int?
    let results: [Show]
}

struct Show: Codable {
    let name: String?
    let rating: Double?
    let poster: String?
    let description: String?

    enum CodingKeys: String, CodingKey {
        case name
        case rating = "vote_average"
        case poster = "poster_path"
        case description = "overview"
    }
}
