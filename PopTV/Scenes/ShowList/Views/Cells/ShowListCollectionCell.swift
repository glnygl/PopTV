//
//  ShowListCollectionCell.swift
//  PopTV
//
//  Created by Gülenay Gül on 15.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import AlamofireImage

class ShowListCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func assign(model: Show) {
        nameLabel.text = model.name
        ratingLabel.text = String(model.rating ?? 0.0)
        if let poster = model.poster,  let url = URL(string: "https://image.tmdb.org/t/p/original" + poster) {
            posterImage.af_setImage(withURL: url)
        }
    }
    
}
