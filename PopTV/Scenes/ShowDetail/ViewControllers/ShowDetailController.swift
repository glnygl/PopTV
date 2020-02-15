//
//  ShowDetailController.swift
//  PopTV
//
//  Created by Gülenay Gül on 14.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import UIKit

final class ShowDetailController: BaseController {
    
    let viewModel = ShowDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setViewModel(controller: self) { }
    }

}
