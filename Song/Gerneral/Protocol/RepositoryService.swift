//
//  Endpoint.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-30.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation


protocol RepositoryService {
    // the element needed to construct a url request
    var url:URL {get}
    var body: [String:Any]? {get}
    var head: [String:String]? {get}
    var httpMethod: String {get}
    var type: RequestType {get}
    func getRequest() -> URLRequest
}

extension RepositoryService {
    func getRequest() -> URLRequest {
        var urlRequest = URLRequest(url: self.url)
        if let body = self.body {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        if let header = self.head {
            for key in header.keys {
                urlRequest.setValue(header[key], forHTTPHeaderField: key)
            }
        }
        return urlRequest
    }
    
    
    
    var type:RequestType {
        return .data
    }
    
    func urlSessionTask(request: URLRequest, completion: @escaping (ServiceResponse) -> Void) -> URLSessionTask {
        
        switch type {
        case .data:
            return URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                completion(ServiceResponse(response: response, data: data, error:error))
            }
        }
    }
    
}


enum RequestType {
    case data
  
    
}
