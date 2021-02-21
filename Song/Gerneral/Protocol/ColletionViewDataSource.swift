//
//  ListDataSource.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-31.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit




protocol CollectionViewSection {

    associatedtype U:UICollectionViewCell,ListCell
    var items: [U.T] {get}
    var id:String {get}
}




extension CollectionViewSection {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> U {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? U   else {
            return U()
        }
        cell.configure(with: items[indexPath.row])
        return cell
    }
}


class CollectionDataSource<SectionType:CollectionViewSection>: NSObject,UICollectionViewDataSource {
    
    var sections: [SectionType] = []
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return sections[section].items.count
         }
         
         func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
           return sections[indexPath.section].collectionView(collectionView, cellForItemAt: indexPath)
         }
         
         func numberOfSections(in collectionView: UICollectionView) -> Int {
             return sections.count
         }
}




