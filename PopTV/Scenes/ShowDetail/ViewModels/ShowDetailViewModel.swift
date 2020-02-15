//
//  ShowDetailViewModel.swift
//  PopTV
//
//  Created by Gülenay Gül on 14.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import Foundation

final class ShowDetailViewModel: BaseViewModelProtocol {

    typealias ViewType = ShowDetailView
    typealias ControllerType = ShowDetailController
    
    var view: ShowDetailView?
    weak var controller: ShowDetailController?
    
    var show: Show?
    
    func setViewModel(controller: BaseController, viewLoadComplete: () -> Void) {
        guard
             let controller = controller as? ShowDetailController,
             let view = controller.view as? ShowDetailView else { return }

         view.viewModel = self
         view.controller = controller
         self.controller = controller
         self.view = view
         view.viewModelDidSet()
         viewLoadComplete()
    }
    
}
