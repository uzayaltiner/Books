//
//  SearchVC.swift
//  Books
//
//  Created by Uzay Altıner on 22.09.2022.
//

import UIKit

class SearchVC: UIViewController, UISearchBarDelegate {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var searchTableView: UITableView!
    @IBOutlet var searchStyleBtn: UIButton!
    var isSearchByName = true

    var filteredBooks: [Book]!
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarOperation(view: self)
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchBar.delegate = self
        searchBar.searchTextField.autocapitalizationType = .none
        filteredBooks = books
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollection), name: NSNotification.Name("reloadData"), object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("reloadData"), object: nil)
    }

    @objc func reloadCollection() {
        filteredBooks = books
        searchTableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredBooks = books
        if searchText != "" {
            if isSearchByName {
                filteredBooks = books.filter { $0.name!.lowercased().hasPrefix(searchText.lowercased()) }
            } else {
                filteredBooks = books.filter { $0.author!.lowercased().hasPrefix(searchText.lowercased()) }
            }
        } else {
            filteredBooks = books
        }

        searchTableView.reloadData()
    }

    @IBAction func searchStyleButtonTapped(_ sender: Any) {
        if !isSearchByName {
            searchStyleBtn.setTitle("name", for: .normal)
        } else {
            searchStyleBtn.setTitle("author", for: .normal)
        }

        isSearchByName.toggle()
    }
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBooks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "SearchBookCell") as! SearchBookCell
        cell.setup(with: filteredBooks[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let choosenBook = filteredBooks[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: choosenBook)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let detailController = segue.destination as! DetailVC
            detailController.choosenBook = sender as! Book
        }
    }
}
