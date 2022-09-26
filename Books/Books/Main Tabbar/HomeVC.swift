//
//  HomeVC.swift
//  Books
//
//  Created by Uzay Altıner on 22.09.2022.
//

import UIKit

class HomeVC: UIViewController {
    var sortedBooks: [Book]!
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

    @IBAction func filterBtnTapped(_ sender: Any) {
        if sortingCounter < 3 {
            sortingCounter += 1
        } else {
            sortingCounter = 0
        }
        print(sortingCounter)
        switch sortingCounter {
        case 0:
            sortedBooks = books
        case 1:
            sortedBooks = books.sorted(by: { ($0.date?.toDateTime())! > ($1.date?.toDateTime())! })
        case 2:
            sortedBooks = books.sorted(by: { ($0.date?.toDateTime())! < ($1.date?.toDateTime())! })
        case 3:
            sortedBooks = books.filter { $0.isFavorite == true }
        default:
            break
        }
        collectionView.reloadData()
    }

    @objc func reloadCollection() {
        sortedBooks = books
        collectionView.reloadData()
    }
}

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
}
