//
//  FavBooksCell.swift
//  Books
//
//  Created by Uzay Altıner on 24.09.2022.
//

import UIKit

class FavBooksCell: UITableViewCell {
    @IBOutlet var favBookImgView: UIImageView!
    @IBOutlet var favBookNameLabel: UILabel!
    @IBOutlet var favBookAuthorLabel: UILabel!
    @IBOutlet var favBookDateLabel: UILabel!
    @IBOutlet var favBookfavButton: UIButton!

    func setup(with book: Book) {
        favBookImgView.downloaded(from: book.image!)
        favBookNameLabel.text = book.name
        favBookAuthorLabel.text = book.author
        favBookDateLabel.text = book.date
    }

    @IBAction func favButtonTapped(_ sender: UIButton) {
        let choosenBook = favBooks[sender.tag]
        if let index = books.firstIndex(where: { $0.name == choosenBook.name }) {
            books[index].isFavorite = false
            CoreDataHandler().deleteFromCoreData(choosenBook: choosenBook)
        }
    }
}
