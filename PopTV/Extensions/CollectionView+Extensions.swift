//
//  CollectionView+Extensions.swift
//  PopTV
//
//  Created by Gülenay Gül on 15.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register(types : [CellType]) {
        types.forEach({ (type) in
            let nib = UINib(nibName: type.rawValue, bundle: nil)
            self.register(nib, forCellWithReuseIdentifier: type.rawValue)
        })
    }
    
    func dequeue<T : UICollectionViewCell>(type : String, indexPath : IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type, for: indexPath) as! T
    }
}
