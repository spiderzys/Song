//
//  DetailerControllerGenerator.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-31.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation
import UIKit
import AVKit

class ControllerGenerator {
    
    
    static func getController(type: ControllerType) -> UIViewController {
        switch  type{
        case .SongDetail(let song):
            let viewController = SongViewController(nibName: "SongViewController", bundle: nil)
            viewController.viewModel = SongViewModel(song:song)
            viewController.player = AVPlayer()
            return viewController
        case .SongList(let length):
            let viewController = TopSongCollectionViewController(nibName: "TopSongCollectionViewController", bundle: nil)
            viewController.viewModel = TopSongViewModel(listLength: length)
            
            return viewController
        }
    }
    
    enum ControllerType {
        case SongList(length:Int)
        case SongDetail(song:Song)
    }
    
}





