//
//  HomeDatasourceController.swift
//  TwitterLBTA
//
//  Created by Eduardo de la Cruz on 3/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import LBTAComponents

// MARK: - HomeDatasourceControler (DatasourceController) Class

class HomeDatasourceController: DatasourceController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(r: 232.0, g: 236.0, b: 241.0)
        
        setupNavigationBarItems()
        
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if let user = self.datasource?.item(indexPath) as? User
        {
            // Lets get an estimation of height of our cell based on user.bioText
            
            let approximateWidthOfBioTextView = view.frame.width - 12.0 - 50.0 - 12.0 - 2.0
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000.0)
            let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66.0)
        }
        
        return CGSize(width: view.frame.width, height: 200.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        if section == 1
        {
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 50.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
    {
        if section == 1
        {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64.0)
    }
}
