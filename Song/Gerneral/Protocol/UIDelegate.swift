//
//  UIDelegate.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-31.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit

protocol UIDelegate:NSObject {
    func showAlert(message:String?, interval: TimeInterval)
}


protocol DataSourceDelegate:NSObject {
    func didSectionUpdated(section: Int)
}

extension DataSourceDelegate where Self: UICollectionViewController {
    func didSectionUpdated(section: Int) {
        DispatchQueue.main.async {
            if self.collectionView.numberOfSections <= section {
                self.collectionView.reloadData()
            }
            else {
               self.collectionView.reloadSections(IndexSet(integersIn: section...section))
            }
            
        }
        
    }
}
