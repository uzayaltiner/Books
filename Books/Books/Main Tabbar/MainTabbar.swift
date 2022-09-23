//
//  MainTabbar.swift
//  Books
//
//  Created by Uzay Altıner on 22.09.2022.
//

import UIKit

class MainTabbar: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
        tabBar.isOpaque = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
}
