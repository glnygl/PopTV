//
//  ShowDetailView.swift
//  PopTV
//
//  Created by Gülenay Gül on 14.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import UIKit

final class ShowDetailView: BaseXibView, BaseViewProtocol {
    
    typealias ViewModelType = ShowDetailViewModel
    typealias ControllerType = ShowDetailController
    
    var viewModel: ShowDetailViewModel?
    weak var controller: ShowDetailController?
    
    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func viewModelDidSet() {
        guard let vm = self.viewModel, let show = vm.show else { return }
        assign(model: show)
    }
    
    func assign(model: Show) {
        guard let vc = self.viewModel?.controller else { return }
        if let poster = model.poster, let url = URL(string: Constants.imgCdnPath + poster) {
            showImageView.setImageFromUrl(url: url)
        }
        descriptionLabel.text = model.description
        vc.title = model.name
    }
    
}
