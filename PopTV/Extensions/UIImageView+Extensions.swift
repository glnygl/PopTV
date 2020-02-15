//
//  UIImageView+Extensions.swift
//  PopTV
//
//  Created by Gülenay Gül on 15.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import AlamofireImage

extension UIImageView {
    
    func setImageFromUrl(url: URL) {
        let imageFilter = AspectScaledToFillSizeFilter(size: self.frame.size)
        self.af_setImage(withURL: url,
                                placeholderImage: nil,
                                filter:imageFilter)
    }
}
