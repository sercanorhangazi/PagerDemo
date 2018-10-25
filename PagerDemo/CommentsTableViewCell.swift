//
//  CommentsTableViewCell.swift
//  PagerDemo
//
//  Created by Sercan Orhangazi on 24.10.2018.
//  Copyright © 2018 Sercan Orhangazi. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    let comments = [
        "Lorem ipsum.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ante augue, tristique vitae turpis sed, porttitor luctus sapien.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ante augue, tristique vitae turpis sed, porttitor luctus sapien. Maecenas ut lorem pretium, molestie dui ut, accumsan sem.",
    ]
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "commentCollectionViewCell", for: indexPath) as? CommentCollectionViewCell else { return UICollectionViewCell() }
        cell.commentLabel.text = comments[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    
}
