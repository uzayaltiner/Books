//
//  AllBooksCell.swift
//  Books
//
//  Created by Uzay Altıner on 24.09.2022.
//

import CoreData
import UIKit

class AllBooksCell: UICollectionViewCell {
    @IBOutlet var bookImgView: UIImageView!
    @IBOutlet var bookNameLabel: UILabel!
    @IBOutlet var favButton: UIButton!

    func setup(with book: Book) {
        bookImgView.downloaded(from: book.image!)
        bookNameLabel.text = book.name

        if book.isFavorite == true {
            favButton.tintColor = .yellow
        } else {
            favButton.tintColor = .systemGray
        }
    }

    @IBAction func favButtonTapped(_ sender: UIButton) {
        if books[sender.tag].isFavorite != true {
            CoreDataHandler().saveToCoreData(senderTag: sender.tag)
        } else {
            if favBooks.contains(where: { $0.name == books[sender.tag].name }) {}
        }
        books[sender.tag].isFavorite?.toggle()
        NotificationCenter.default.post(name: NSNotification.Name("reloadData"), object: nil)
    }
}
