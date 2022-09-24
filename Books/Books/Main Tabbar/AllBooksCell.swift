//
//  AllBooksCell.swift
//  Books
//
//  Created by Uzay Altıner on 24.09.2022.
//

import UIKit

class AllBooksCell: UICollectionViewCell {
    @IBOutlet weak var bookImgView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    func setup(with book: Book) {
        bookImgView.image = UIImage(systemName: "star")
        bookNameLabel.text = book.name
    }
}
