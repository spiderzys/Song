//
//  SongService.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-31.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation


enum SongService{
    case topList(limit: Int)
    
    
}


extension SongService: RepositoryService{
  
    
   
    
    var url: URL {
        switch self {
        case .topList(let limit):
            return URL(string: "https://itunes.apple.com/us/rss/topsongs/limit=\(limit)/xml")!
        
        }
    }
    
    var body: [String : Any]? {
        return nil
    }
    
    var head: [String : String]? {
        return nil
    }
    
    var httpMethod: String {
        return "GET"
    }
    
    
}
