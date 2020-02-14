//
//  ShowListViewModel.swift
//  PopTV
//
//  Created by Gülenay Gül on 14.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import RxRelay
import RxSwift

final class ShowListViewModel: BaseViewModelProtocol {

    typealias ViewType = ShowListView
    typealias ControllerType = ShowListController
    
    var view: ShowListView?    
    var controller: ShowListController?
    
    var shows = BehaviorRelay<[Show]>(value: [])
    let disposeBag = DisposeBag()
    
    func setViewModel(controller: BaseController, viewLoadComplete: () -> Void) {
        guard
            let controller = controller as? ShowListController,
            let view = controller.view as? ShowListView else { return }

        view.viewModel = self
        view.controller = controller
        view.viewModelDidSet()
        
        self.controller = controller
        self.view = view
        viewLoadComplete()
    }
    
    func fetchShows() {
        API.fetchShows { [weak self] (result) in
            if let shows = result {
                self?.shows.accept(shows)
            }
        }
    }
    
}
