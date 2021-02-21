//
//  TopSongCollectionViewCell.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-31.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit

class TopSongCollectionViewCell: UICollectionViewCell, ListCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var currentTask: URLSessionDataTask?
    
    @IBOutlet weak var artImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func configure(with item: Song) {
        self.artImageView.image = nil
        self.titleLabel.text = item.title
        guard let url = item.artUrl else {return}
        currentTask = artImageView.loadTaskInCell(url:url)
        currentTask?.resume()
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        currentTask?.cancel()
    }
    
    
}
