//
//  DatabaseHandler.swift
//  Books
//
//  Created by Uzay Altıner on 23.09.2022.
//

import Foundation
import UIKit

class DatabaseHandler {
    init() {
        fetchBooksFromAPI()
    }

    func fetchBooksFromAPI() {
        let url = URL(string: "https://rss.applemarketingtools.com/api/v2/tr/books/top-free/50/books.json")

        let session = URLSession.shared

        let task = session.dataTask(with: url!) { data, _, error in

            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any]

                        DispatchQueue.main.async {
                            if let feed = jsonResponse!["feed"] as? [String: Any] {
                                if let results = feed["results"] as? [[String: Any]] {
                                    for result in results {
                                        let newBook = Book()
                                        if let name = result["name"] {
                                            if let author = result["artistName"] {
                                                if let date = result["releaseDate"] {
                                                    if let imgUrl = result["artworkUrl100"] {
                                                        newBook.date = (date as! String)
                                                        newBook.author = (author as! String)
                                                        newBook.name = (name as! String)
                                                        newBook.image = (imgUrl as! String)
                                                        if favBooks.contains(where: {$0.name == newBook.name}) {
                                                            newBook.isFavorite = true
                                                        }
                                                        
                                                    }
                                                }
                                            }
                                        }

                                        if !books.contains(where: { $0.name == newBook.name }) {
                                            books.append(newBook)
                                        }

                                        NotificationCenter.default.post(name: NSNotification.Name("reloadData"), object: nil)
                                    }
                                }
                            }
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }

        task.resume()
    }
}
