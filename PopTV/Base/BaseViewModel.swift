//
//  BaseViewModelProtocol.swift
//  PopTV
//
//  Created by Gülenay Gül on 14.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import UIKit

typealias VoidHandler = () -> Void

protocol BaseViewModelProtocol {
    associatedtype ViewType
    associatedtype ControllerType
    var view: ViewType? { get set }
    var controller : ControllerType? { get set }
    func setViewModel(controller: BaseController, viewLoadComplete: VoidHandler)
}
