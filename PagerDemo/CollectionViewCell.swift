//
//  CollectionViewCell.swift
//  PagerDemo
//
//  Created by Sercan Orhangazi on 25.10.2018.
//  Copyright © 2018 Sercan Orhangazi. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var commentLabel: UILabel!
    
    private static let sizingCell = UINib(nibName: "commentCollectionViewCell", bundle: nil).instantiate(withOwner: nil, options: nil).first! as! CollectionViewCell
    
    public func configure(with viewModel: ExampleViewModel, isSizing: Bool = false) {
        commentLabel.text = viewModel.comment
        
        guard !isSizing else {
            return
        }
        
        layer.cornerRadius = 2.0
    }
    
    public static func height(for viewModel: ExampleViewModel, forWidth width: CGFloat) -> CGFloat {
        sizingCell.prepareForReuse()
        sizingCell.configure(with: viewModel, isSizing: true)
        sizingCell.layoutIfNeeded()
        var fittingSize = UIView.layoutFittingCompressedSize
        fittingSize.width = width
        let size = sizingCell.contentView.systemLayoutSizeFitting(fittingSize,
                                                                  withHorizontalFittingPriority: .required,
                                                                  verticalFittingPriority: .defaultLow)
        
        guard size.height < 250 else {
            return 250
        }
        
        return size.height
    }

}
