//
//  ShowListController.swift
//  PopTV
//
//  Created by Gülenay Gül on 14.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import UIKit

final class ShowListController: BaseController {
    
    let viewModel = ShowListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setViewModel(controller: self) {
            viewModel.fetchShows()
        }
    }

}
