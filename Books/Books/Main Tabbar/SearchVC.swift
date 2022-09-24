//
//  SearchVC.swift
//  Books
//
//  Created by Uzay Altıner on 22.09.2022.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarOperation(view: self)
        searchTableView.delegate = self
        searchTableView.dataSource = self
    }
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "SearchBookCell") as! SearchBookCell
        cell.bookNameLabel.text = "iOS Develoler"
        cell.bookImgView.image = UIImage(systemName: "star")
        cell.authorNameLabel.text = "Uzay Altıner"
        cell.dateLabel.text = "12.07.2021"
        return cell
    }
    
    
}
