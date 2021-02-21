//
//  TopSongCollectionViewDataSource.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-31.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit


class TopSongCollectionViewDataSource: CollectionDataSource<TopSongCollectionSection> {
    
   
}


class NumberSection: CollectionViewSection {
    
  
    
    var items: [Int]
    
    init(_ integers: [Int]) {
        self.items = integers
    }
    
    var id = "number"
    typealias U = NumberCollectionViewCell
}

class TopSongCollectionSection: CollectionViewSection {
    var items: [Song]
    
    
    init(_ songs:[Song]) {
        self.items = songs
    }
    
    var id: String = "top"
    
  
    
    typealias U = TopSongCollectionViewCell
    
    
}



