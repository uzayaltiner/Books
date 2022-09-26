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
    
    func setup(with book: Book) {
        favBookImgView.downloaded(from: book.image!)
        favBookNameLabel.text = book.name
        favBookAuthorLabel.text = book.author
        favBookDateLabel.text = book.date
    }
}
