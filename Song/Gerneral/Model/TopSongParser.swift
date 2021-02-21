//
//  TopSongParser.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-30.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation




class TopSongParser:NSObject {
    // the parser to convert xml to
    private var name:String?
    private var artist: String?
    private var artUrlString: String?
    private var previewUrlString: String?
    private var releaseDate: String?
    private var price: String?
    private var currentElement: String?
    
    // above are the temp variables to record attributes of a song.
    private var songs = [Song]()
    // the songs from xml
    
    
    
    private var parserCompletionHandler: (([Song]) -> Void)?
    // successful handler
    private var parserFailureHandler: ((Error?) -> Void)?
    // failure handler

    
    
    
    
}

extension TopSongParser: Parser {

    func parse(data: Data, success: @escaping ([Song]) -> Void,  failure: @escaping(Error?) -> Void) {
        // parse the date by implementing XMLParserDelegate
         let parser = XMLParser(data: data)
         self.parserCompletionHandler = success
         self.parserFailureHandler = failure
         parser.delegate = self
         parser.parse()
     }
    
}



extension TopSongParser: XMLParserDelegate {
    
    
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        switch elementName {
        case "entry":
             
             guard let name = name, let artist = artist, let artUrlString = artUrlString, let previewUrlString = previewUrlString, let releaseDate = releaseDate, let price = price else {
                resetRecord()
                return
             }
             
             songs.append(Song(name: name, artist: artist, artUrlString: artUrlString, previewUrlString: previewUrlString, releaseDate: releaseDate, price: price))
             resetRecord()
        case "im:name":
            if self.name == nil {
                self.name = currentElement
            }
            
        case "im:price":
            self.price = currentElement
        case "im:releaseDate":
            self.releaseDate = currentElement
        case "im:image":
            self.artUrlString = currentElement
        case "im:artist":
            self.artist = currentElement
        default:
            break
        }
        
        currentElement = nil
       
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        // the value of current key
       
        self.currentElement = string
    }
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]){
        // the parser is beginning to parse the key. if the key is entry, it means we will have a new song, otherwise, it should be an attribute
        if elementName == "entry" {
            resetRecord()
            // reset the recorded attributes when we have a new song
        }
        else if elementName == "link", attributeDict["im:assetType"] == "preview" {
            // get the preview url from "link"
            self.previewUrlString = attributeDict["href"]
        }
      
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        self.parserCompletionHandler?(songs)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        self.parserFailureHandler?(parseError)
    }
    
    func resetRecord() {
        self.artist = nil
        self.artUrlString = nil
        self.currentElement = nil
        self.price = nil
        self.releaseDate = nil
        self.previewUrlString = nil
        self.name = nil
    }
}
