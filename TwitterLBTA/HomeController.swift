//
//  HomeController.swift
//  TwitterLBTA
//
//  Created by Eduardo de la Cruz on 3/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit

class WordCell: UICollectionViewCell
{
    // MARK: - Global Variables
    
    let wordLabel: UILabel =
    {
        let label = UILabel()
        label.text = "TEST TEST TEST"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - WordCell Init
    
    // This is called when a cell is dequeued
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        self.setupViews()
    }
    
    // MARK: - Cell Setup
    
    func setupViews()
    {
        self.backgroundColor = .yellow
        
        addSubview(self.wordLabel)
        
        wordLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    // MARK: - Soma code I HAD to put
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    // MARK: - GLobal Variables
    
    let cellId = "cellId"
    let headerId = "headerId"
    let footerId = "footerId"
    
    // MARK: - HomeController Load
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(WordCell.self, forCellWithReuseIdentifier: cellId) // Inner Cells creation
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId) // Header Creation
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId) // Footer Creation
    }
    
    // MARK: - CollectionView Delegate and DataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4 // How many cell i want
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell // Cell append on collection view
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize // Inner cell size
    {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        if kind == UICollectionElementKindSectionHeader // Validation for kind (footer or header)
        {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
            
            header.backgroundColor = .blue
            
            return header
        }
        else
        {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
            
            footer.backgroundColor = .green
            
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize // Header Size
    {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize // Footer Size
    {
        return CGSize(width: view.frame.width, height: 100)
    }
}
