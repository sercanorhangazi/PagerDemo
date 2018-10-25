//
//  CommentsTableViewCell.swift
//  PagerDemo
//
//  Created by Sercan Orhangazi on 24.10.2018.
//  Copyright © 2018 Sercan Orhangazi. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var data: [ExampleModel] = ExampleData.dataset
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectioView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //setupCollectioView()
    }
    
    private func setupCollectioView() {
        let nib = UINib(nibName: "commentCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "commentCollectionViewCell")
        
        let edgeInsets = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        flowLayout.sectionInset = edgeInsets
        
        setCollectionViewHeight(with: data, edgeInsets: flowLayout.sectionInset)
    }
    
    private func setCollectionViewHeight(with data: [ExampleModel], edgeInsets: UIEdgeInsets) {
        let viewModels = data.compactMap { ExampleViewModel(example: $0) }
        
        guard let viewModel = calculateHeighest(with: viewModels, forWidth: collectionView.bounds.width) else {
            return
        }
        
        let height = CollectionViewCell.height(for: viewModel, forWidth: collectionView.bounds.width)
        
        flowLayout.itemSize = CGSize(width: collectionView.bounds.width, height: height)
        
        collectionViewHeightConstraint.constant = height + edgeInsets.top + edgeInsets.bottom
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "commentCollectionViewCell", for: indexPath) as! CollectionViewCell
        let example = data[indexPath.item]
        let viewModel = ExampleViewModel(example: example)
        
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    
}
