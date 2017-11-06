//
//  HomeDatasourceControllerNavBarExtension.swift
//  TwitterLBTA
//
//  Created by Eduardo de la Cruz on 6/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit

extension HomeDatasourceController
{ 
    func setupNavigationBarItems()
    {
        setupLeftNavItems()
        setupRightNavItems()
        setupRemainingNavItems()
    }
    
    private func setupRemainingNavItems()
    {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "Logo").withRenderingMode(.alwaysOriginal))
        titleImageView.frame = CGRect(x: 0.0, y: 0.0, width: 34.0, height: 34.0)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) // This two methods erase the line of navigation bar
        
        let navBarSeparatorView = UIView()
        navBarSeparatorView.backgroundColor = UIColor(r: 230.0, g: 230.0, b: 230.0)
        view.addSubview(navBarSeparatorView)
        
        navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0.0, leftConstant: 0.0, bottomConstant: 0.0, rightConstant: 0.0, widthConstant: 0.0, heightConstant: 0.5)
    }
    
    private func setupLeftNavItems()
    {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "Follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0.0, y: 0.0, width: 34.0, height: 34.0)
        followButton.contentMode = .scaleAspectFit
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems()
    {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "Find").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0.0, y: 0.0, width: 34.0, height: 34.0)
        searchButton.contentMode = .scaleAspectFit
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "Compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0.0, y: 0.0, width: 34.0, height: 34.0)
        composeButton.contentMode = .scaleAspectFit
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
}
