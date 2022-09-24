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
    var image: UIImage?

    init(name: String? = nil, author: String? = nil, image: UIImage? = nil) {
        self.name = name
        self.author = author
        self.image = image
    }
}

let books: [Book] = [
    Book(name: "adas", author: "asdaskd", image: UIImage(systemName: "star")),
    Book(name: "adas", author: "asdaskd", image: UIImage(systemName: "star")),
    Book(name: "adas", author: "asdaskd", image: UIImage(systemName: "star")),
    Book(name: "adas", author: "asdaskd", image: UIImage(systemName: "star")),
    Book(name: "adas", author: "asdaskd", image: UIImage(systemName: "star")),
    Book(name: "adas", author: "asdaskd", image: UIImage(systemName: "star")),
    Book(name: "adas", author: "asdaskd", image: UIImage(systemName: "star")),
    Book(name: "adas", author: "asdaskd", image: UIImage(systemName: "star")),
    Book(name: "adas", author: "asdaskd", image: UIImage(systemName: "star")),
    Book(name: "adas", author: "asdaskd", image: UIImage(systemName: "star"))
]
