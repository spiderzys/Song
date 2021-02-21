//
//  UIImageView.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-31.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit


extension UIImageView {
    
    func load(url: URL) {
        // load image from URL
        DispatchQueue.global().async { [weak self] in
            if let cachedImage = ImageStore.imageCache.object(forKey: url.absoluteString as NSString) {
                DispatchQueue.main.async {
                    self?.image = cachedImage
                }
                
            }
            else if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        ImageStore.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    }
                }
            }
        }
    }
    
    func loadTaskInCell(url:URL) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            DispatchQueue.main.async {
                guard let data = data else {return}
                self.image = UIImage(data: data)
                
            }
        }
        
        return task
        
        
    }
    
    
}



class ImageStore {
    static let imageCache = NSCache<NSString, UIImage>()
}
