//
//  HomeVC.swift
//  Books
//
//  Created by Uzay Altıner on 22.09.2022.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet var sortingButton: UIBarButtonItem!

    @IBOutlet var collectionView: UICollectionView!
    var sortingCounter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        sortedBooks = books
        collectionView.delegate = self
        collectionView.dataSource = self
        navBarOperation(view: self)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollection), name: NSNotification.Name("reloadData"), object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("reloadData"), object: nil)
    }

    @IBAction func filterBtnTapped(_ sender: Any) {
        let ac = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        ac.addAction(UIAlertAction(title: "New to old", style: .default, handler: { [self] _ in
            sortedBooks = sortedBooks.sorted(by: { ($0.date?.toDateTime())! > ($1.date?.toDateTime())! })
            collectionView.reloadData()
        }))
        ac.addAction(UIAlertAction(title: "Old to new", style: .default, handler: { [self] _ in
            sortedBooks = sortedBooks.sorted(by: { ($0.date?.toDateTime())! < ($1.date?.toDateTime())! })
            collectionView.reloadData()
        }))
        ac.addAction(UIAlertAction(title: "Favorites", style: .default, handler: { [self] _ in
            sortedBooks = sortedBooks.filter { $0.isFavorite == true }
            collectionView.reloadData()
        }))

        ac.addAction(UIAlertAction(title: "Default", style: .default, handler: { [self] _ in
            sortedBooks = books
            collectionView.reloadData()
        }))

        present(ac, animated: true)
    }

    @objc func reloadCollection() {
        if sortedBooks.isEmpty {
            sortedBooks = books
        }
        collectionView.reloadData()
    }
}

// MARK: - Collection view data sources

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllBooksCell", for: indexPath) as! AllBooksCell
        cell.setup(with: sortedBooks[indexPath.row])
        cell.favButton.tag = indexPath.row
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortedBooks.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(sortedBooks[indexPath.row].name)
    }
}
