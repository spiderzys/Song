//
//  Response.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-30.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation



struct ServiceResponse {
    let response: URLResponse?
    let data: Data?
    let error: Error?
}
