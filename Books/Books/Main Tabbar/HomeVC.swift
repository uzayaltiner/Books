//
//  HomeVC.swift
//  Books
//
//  Created by Uzay Altıner on 22.09.2022.
//

import UIKit

class HomeVC: UIViewController {
    var arr = ["asdasdad", "asdasd", "asdads", "adasdasd", "asdasdasd", "adasdasda", "asdasd"]

    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
        navBarOperation(view: self)
    }

    func createCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    @IBAction func filterBtnTapped(_ sender: Any) {}
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllBooksCell", for: indexPath) as! AllBooksCell
        cell.setup(with: books[indexPath.row])
        cell.backgroundColor = .red
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
