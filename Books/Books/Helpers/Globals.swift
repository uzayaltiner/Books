//
//  Globals.swift
//  Books
//
//  Created by Uzay Altıner on 22.09.2022.
//

import Foundation
import UIKit

func navBarOperation(view: UIViewController) {
    let app = UINavigationBarAppearance()
    app.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
    view.navigationController?.navigationBar.scrollEdgeAppearance = app
    view.navigationController?.navigationBar.tintColor = .blue
    view.navigationItem.standardAppearance = app
    view.navigationItem.scrollEdgeAppearance = app
}
