//
//  DynamicHeightCalculable.swift
//  PagerDemo
//
//  Created by Sercan Orhangazi on 25.10.2018.
//  Copyright © 2018 Sercan Orhangazi. All rights reserved.
//

import UIKit

protocol DynamicHeightCalculable {
    func height(forWidth: CGFloat) -> CGFloat
}

func calculateHeighest<T: DynamicHeightCalculable>(with viewModels: [T], forWidth width: CGFloat) -> T? {
    var largestViewModel = viewModels.first
    var largestHeight: CGFloat = 0
    
    for viewModel in viewModels {
        let height = viewModel.height(forWidth: width)
        
        if height > largestHeight {
            largestHeight =  height
            largestViewModel = viewModel
        }
    }
    
    return largestViewModel
}
