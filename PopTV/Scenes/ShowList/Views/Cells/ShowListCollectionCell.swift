//
//  ShowListCollectionCell.swift
//  PopTV
//
//  Created by Gülenay Gül on 15.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import Alamofire
import AlamofireImage

class ShowListCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImage.af_cancelImageRequest()
    }
    
    func assign(model: Show) {
        nameLabel.text = model.name
        ratingLabel.text = String(model.rating ?? 0.0)
        posterImage.image = nil
        if let poster = model.poster, let url = URL(string: Constants.imgCdnPath + poster) {
            posterImage.setImageFromUrl(url: url)
        }
    }
    
}
