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
            favButton.tintColor = .systemYellow
        } else {
            favButton.tintColor = .systemGray
        }
    }

    @IBAction func favButtonTapped(_ sender: UIButton) {
        let choosenBook = sortedBooks[sender.tag]
        if choosenBook.isFavorite != true {
            if let index = books.firstIndex(where: { $0.name == choosenBook.name }) {
                books[index].isFavorite = true
                CoreDataHandler().saveToCoreData(choosenBook: choosenBook)
            }
        }
    }
}
