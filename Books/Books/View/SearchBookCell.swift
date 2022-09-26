//
//  SearchBookCell.swift
//  Books
//
//  Created by Uzay Altıner on 24.09.2022.
//

import UIKit

class SearchBookCell: UITableViewCell {
    @IBOutlet var bookImgView: UIImageView!
    @IBOutlet var bookNameLabel: UILabel!
    @IBOutlet var authorNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    func setup(with book: Book) {
        bookImgView.downloaded(from: book.image!)
        bookNameLabel.text = book.name
        authorNameLabel.text = book.author
        dateLabel.text = book.date
    }
}
