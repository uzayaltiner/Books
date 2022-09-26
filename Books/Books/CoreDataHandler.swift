//
//  CoreDataHandler.swift
//  Books
//
//  Created by Uzay Altıner on 25.09.2022.
//

import CoreData
import Foundation
import UIKit

class CoreDataHandler {
    func saveToCoreData(senderTag: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let manageContent = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "FavBooks", in: manageContent)!
        let book = NSManagedObject(entity: userEntity, insertInto: manageContent)
        
        book.setValue(books[senderTag].name, forKey: "name")
        book.setValue(books[senderTag].image, forKey: "img")
        book.setValue(books[senderTag].date, forKey: "date")
        book.setValue(books[senderTag].author, forKey: "author")
        
        do {
            try manageContent.save()
        } catch let error as NSError {
            print("could not save . \(error), \(error.userInfo)")
        }
        DatabaseHandler().fetchBooksFromAPI()
    }
    
    func deleteFromCoreData(){
        
    }
    
    func fetchData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let manageContent = appDelegate.persistentContainer.viewContext
        let fetchData = NSFetchRequest<NSFetchRequestResult>(entityName: "FavBooks")
        
        do {
            let result = try manageContent.fetch(fetchData)
            
            for data in result as! [NSManagedObject] {
                let name = data.value(forKey: "name") as? String
                let author = data.value(forKey: "author") as? String
                let date = data.value(forKey: "date") as? String
                let img = data.value(forKey: "img") as? String
                
                let newBook = Book(name: name, author: author, image: img, date: date, isFavorite: true)
                
                favBooks.append(newBook)
            }
        } catch {
            print("err")
        }
    }
}
