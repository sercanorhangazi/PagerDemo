//
//  ExampleViewModel.swift
//  PagerDemo
//
//  Created by Sercan Orhangazi on 25.10.2018.
//  Copyright © 2018 Sercan Orhangazi. All rights reserved.
//

import UIKit

struct ExampleViewModel: DynamicHeightCalculable {
    
    let comment: String?
    
    init(example: ExampleModel) {
        comment = example.comment
    }
    
    public func height(forWidth width: CGFloat) -> CGFloat {
        let sizingLabel = UILabel()
        sizingLabel.numberOfLines = 0
        sizingLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        sizingLabel.lineBreakMode = .byTruncatingTail
        sizingLabel.text = comment
        
        let maxSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let size = sizingLabel.sizeThatFits(maxSize)
        
        return size.height
    }
    
}
