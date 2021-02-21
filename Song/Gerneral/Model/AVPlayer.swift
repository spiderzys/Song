//
//  Previewable.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-31.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import AVKit

protocol Previewer {
    func preview(item: Previewable)
}

extension AVPlayer: Previewer {
    func preview(item: Previewable) {
        guard let url = item.previewUrl else {return}
        self.replaceCurrentItem(with: AVPlayerItem(url: url))
        self.play()
    }
    
    
    
    
    
}
