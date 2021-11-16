//
//  TabbarController.swift
//  KD Tiktok-Clone
//
//  Created by Sam Ding on 9/8/20.
//  Copyright © 2020 Kaishan. All rights reserved.
//

import Foundation
import UIKit

class TabBarController:  UITabBarController, UITabBarControllerDelegate {
    
    var homeNavigationController: BaseNavigationController!
    var shopViewController: HomeViewController!
    var discoverViewController: DiscoverViewController!
    var mediaViewController: MediaViewController!
    var forYouViewController: InboxViewController!
    var cartViewController: ProfileViewController!

    
    //MARK: - LifeCycles
    override func viewDidLoad(){
        super.viewDidLoad()
        self.delegate = self
        
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        tabBar.tintColor = .orange
        
        shopViewController = HomeViewController()
        homeNavigationController = BaseNavigationController(rootViewController: shopViewController)
        forYouViewController = InboxViewController()
        cartViewController = ProfileViewController()
        discoverViewController = DiscoverViewController()
        mediaViewController = MediaViewController()
     
        shopViewController.tabBarItem.image = UIImage(named: "iconUploadUnselected")
        shopViewController.tabBarItem.selectedImage = UIImage(named: "iconUploadSelected")
        
        discoverViewController.tabBarItem.image = UIImage(named: "iconPhotosUnselected")
        discoverViewController.tabBarItem.selectedImage = UIImage(named: "iconPhotosSelected")
        
        forYouViewController.tabBarItem.image = UIImage(named: "iconHomeStoreUnselected")
        forYouViewController.tabBarItem.selectedImage = UIImage(named: "iconHomeStoreSelected")
        
        mediaViewController.tabBarItem.image = UIImage(named: "iconAccountUnselected")
        mediaViewController.tabBarItem.selectedImage = UIImage(named: "iconAccountSelected")
        
        cartViewController.tabBarItem.image = UIImage(named: "iconCartUnselected")
        cartViewController.tabBarItem.selectedImage = UIImage(named: "iconCartSelected")
        
        viewControllers = [forYouViewController, discoverViewController, homeNavigationController, mediaViewController, cartViewController]
        selectedIndex = 2
        let tabBarItemTitle = ["Store", "Photos", "For YOU", "Account", "Cart"]
        
        for (index, tabBarItem) in tabBar.items!.enumerated() {
            tabBarItem.title = tabBarItemTitle[index]
        }
    }
    
    //MARK: UITabbar Delegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.isKind(of: MediaViewController.self) {
            let vc =  UIStoryboard(name: "MediaViews", bundle: nil).instantiateViewController(identifier: "MediaVC") as! MediaViewController
            let navigationController = BaseNavigationController.init(rootViewController: vc)
            navigationController.modalPresentationStyle = .overFullScreen
            self.present(navigationController, animated: true, completion: nil)
            return false
        }
      return true
    }
    
    
}
