//
//  HomeDatasourceController.swift
//  TwitterLBTA
//
//  Created by Eduardo de la Cruz on 3/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController
{
    // MARK: - Global Variables
    
    let errorMessageLabel : UILabel =
    {
        let label = UILabel()
        label.text = "Apologies something went wrong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        
        return label
    }()
    
    // MARK: - HomeDatasourceController Load
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview() // LBTA Method Call Anchors to top bottom left and right of the view
        
        collectionView?.backgroundColor = UIColor(r: 232.0, g: 236.0, b: 241.0)
        
        setupNavigationBarItems()
        
        Service.sharedIstance.fetchHomeFeed { (homeDatasource, err) in
            if let err = err
            {
                self.errorMessageLabel.isHidden = false
                
                if let apiError = err as? APIError<Service.JSONError>
                {
                    if apiError.response?.statusCode != 200
                    {
                        self.errorMessageLabel.text = "Status code was not 200"
                    }
                }
                
                return
            }
            
            self.datasource = homeDatasource
        }
    }
    
    // MARK: - CollectionView rotation handlerer
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator)
    {
        collectionViewLayout.invalidateLayout() // Rotation to landscape
    }
    
    // MARK: - Spacing between cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
    
    // MARK: - CollectionView Cell Size setup
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        // First seccion of users
        if indexPath.section == 0
        {
            // Lets get an estimation of height of our cell based on user.bioText on users
            
            guard let user = self.datasource?.item(indexPath) as? User else { return .zero }
            
            let estimatedHeight = estimatedHeightForText(user.bioText)
            
            return CGSize(width: view.frame.width, height: estimatedHeight + 66.0)
        }
        else if indexPath.section == 1
        {
            // Lets get an estimation of height of our cell based on tweet.message on tweets
            
            guard let tweet = datasource?.item(indexPath) as? Tweet else { return .zero }
            
            let estimatedHeight = estimatedHeightForText(tweet.message)
            
            return CGSize(width: view.frame.width, height: estimatedHeight + 74.0)
        }
        
        return CGSize(width: view.frame.width, height: 200.0)
    }
    
    // MARK: - Math for height estimation
    
    private func estimatedHeightForText(_ text: String) -> CGFloat
    {
        let approximateWidthOfBioTextView = view.frame.width - 12.0 - 50.0 - 12.0 - 2.0
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000.0)
        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimatedFrame.height
    }
    
    // MARK: - Header CollectionView size setup
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        if section == 1
        {
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 50.0)
    }
    
    // MARK: - Footer CollectionView size setup
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
    {
        if section == 1
        {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64.0)
    }
}
