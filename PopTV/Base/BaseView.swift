//
//  BaseViewProtocol.swift
//  PopTV
//
//  Created by Gülenay Gül on 14.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import UIKit

protocol BaseViewProtocol {
    associatedtype ViewModelType
    associatedtype ControllerType
    var viewModel: ViewModelType? { get set }
    var controller: ControllerType? { get set }
    func viewModelDidSet()
}
