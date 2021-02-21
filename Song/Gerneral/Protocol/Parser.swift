//
//  Parser.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-29.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation


protocol Parser {
    associatedtype T:Decodable
    func parse(data:Data, success: @escaping(T) -> Void, failure: @escaping(Error?) -> Void)
}






protocol JSONParser: Parser {
    
}

extension JSONParser {
    func decode<T:Decodable>(data: Data, success:(T) -> Void, failure: (Error?) -> Void) {
        do {
            let output = try JSONDecoder().decode(T.self, from: data)
            success(output)
        } catch  {
            failure(error)
        }
    }
    
    func parse(data:Data, success: @escaping(T) -> Void, failure: @escaping(Error?) -> Void) {
        
            self.decode(data: data, success: success, failure: failure)
        }
        
}

