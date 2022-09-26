//
//  FavoritesVC.swift
//  Books
//
//  Created by Uzay Altıner on 22.09.2022.
//

import UIKit

class FavoritesVC: UIViewController {
    @IBOutlet var favCollectionView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarOperation(view: self)
        favCollectionView.delegate = self
        favCollectionView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        favCollectionView.reloadData()
    }
}

extension FavoritesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favBooks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favCollectionView.dequeueReusableCell(withIdentifier: "FavBooksCell", for: indexPath) as! FavBooksCell
        cell.setup(with: favBooks[indexPath.row])
        return cell
    }
}
