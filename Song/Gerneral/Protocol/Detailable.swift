//
//  Detailable.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-31.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit



protocol Detailed {
    
}



protocol DetailPresenter {
    associatedtype T: Detailed
    
    func showDetai(item:T, completion: (() -> Void)? )
}



