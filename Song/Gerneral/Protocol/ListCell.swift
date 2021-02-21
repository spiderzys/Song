//
//  ListCell.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-31.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation



protocol ListCell {
    
    associatedtype T
    func configure(with item: T)
    
}

