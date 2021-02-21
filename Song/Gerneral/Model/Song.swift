//
//  Song.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-30.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation


struct Song:Decodable, Detailed, Previewable {
    var name:String
    var artist:String
    var artUrlString:String
    var previewUrlString:String
    var releaseDate: String
    var price:String
    
    var title:String {
        return "\(name)\n\(artist)"
    }
    
    var artUrl:URL? {
        return URL(string: artUrlString)
    }
    
    var previewUrl:URL? {
        return URL(string: previewUrlString)
    }
    
  
    
}



class SongRepository: Repository {
    typealias Service = SongService
    
  
    func getTopSongs(limit:Int, success: @escaping (([Song]) -> Void), failure: @escaping (Error?) -> Void){
        
        self.request(.topList(limit: limit)) { (response) in
            guard response.error == nil else {
                failure(response.error)
                return
            }
            guard let data = response.data else {
                failure(nil)
                return
            }
            self.parse(data: data, parser: TopSongParser(), success: { (songs) in
                success(songs)
            }, failure: { (error) in
                failure(error)
            })
        }
    }
    
    
    
    
    
    
}


