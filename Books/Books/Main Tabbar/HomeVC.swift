//
//  HomeVC.swift
//  Books
//
//  Created by Uzay Altıner on 22.09.2022.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
        navBarOperation(view: self)
    }

    func createCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
    }

    @IBAction func filterBtnTapped(_ sender: Any) {}
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        cell.backgroundColor = .red

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}
