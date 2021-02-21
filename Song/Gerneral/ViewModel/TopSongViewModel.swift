//
//  TopSongViewModel.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-31.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation


class TopSongViewModel {
    weak var delegate: (DataSourceDelegate & UIDelegate)?
    var length: Int
    
    func fetchData() {
        SongRepository().getTopSongs(limit: length, success: {[weak self] (songs) in
            self?.dataSource.sections = [TopSongCollectionSection(songs)]
            self?.delegate?.didSectionUpdated(section: 0)
        }) { [weak self] (error)  in
            self?.delegate?.showAlert(message: error?.localizedDescription, interval: 1)
        }
    }
    
    init(listLength:Int) {
        self.length = listLength
    }
    
    func item(indexPath: IndexPath) -> Song? {
        // return the item from indexPath
        guard indexPath.section < dataSource.sections.count else {return nil}
        guard indexPath.row <  dataSource.sections[indexPath.section].items.count else {return nil}
        
        return dataSource.sections[indexPath.section].items[indexPath.row]
    }
    
    var dataSource = TopSongCollectionViewDataSource()
    
    
}
