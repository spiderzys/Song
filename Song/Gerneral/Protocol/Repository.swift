//
//  View.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-30.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation



protocol Repository {
    associatedtype Service:RepositoryService
    func request(_ service: Service, completion: @escaping (ServiceResponse) -> Void)
    
}


extension Repository {
    func request(_ service: Service, completion: @escaping (ServiceResponse) -> Void) {
        
        let task = service.urlSessionTask(request: service.getRequest(), completion: completion)
        task.resume()
    }
    
    
    func parse<T:Parser,U>(data:Data, parser:T, success: @escaping ((U) -> Void), failure: @escaping (Error?) -> Void) where T.T == U {
        parser.parse(data: data, success: success, failure: failure)
        
    }
}


