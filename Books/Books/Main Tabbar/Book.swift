//
//  Book.swift
//  Books
//
//  Created by Uzay Altıner on 24.09.2022.
//

import Foundation
import UIKit

class Book {
    var name: String?
    var author: String?
    var image: String?
    var date: String?
    var isFavorite: Bool?

    init(name: String? = nil, author: String? = nil, image: String? = nil, date: String? = nil, isFavorite: Bool? = false) {
        self.name = name
        self.author = author
        self.image = image
        self.date = date
    }
}

var books = [Book]()
var favBooks = [Book]()
