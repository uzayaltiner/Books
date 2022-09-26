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
    func saveToCoreData(choosenBook: Book) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let manageContent = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "FavBooks", in: manageContent)!
        let book = NSManagedObject(entity: userEntity, insertInto: manageContent)
        book.setValue(choosenBook.name, forKey: "name")
        book.setValue(choosenBook.image, forKey: "img")
        book.setValue(choosenBook.date, forKey: "date")
        book.setValue(choosenBook.author, forKey: "author")
        book.setValue(true, forKey: "isFav")
        
        do {
            try manageContent.save()
        } catch let error as NSError {
            print("could not save . \(error), \(error.userInfo)")
        }
        CoreDataHandler().fetchData()
        NotificationCenter.default.post(name: NSNotification.Name("reloadData"), object: nil)
    }
    
    func deleteFromCoreData(choosenBook: Book) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavBooks")
        let bookName = choosenBook.name
        request.predicate = NSPredicate(format: "name = %@", bookName!)
        
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let name = result.value(forKey: "name") as? String {
                        context.delete(result)
                        if let index = favBooks.firstIndex(where: { $0.name == choosenBook.name }) {
                            favBooks.remove(at: index)
                        }
                        
                        do {
                            try context.save()
                        } catch {}
                    }
                }
            }
        } catch {}
        NotificationCenter.default.post(name: NSNotification.Name("reloadData"), object: nil)
    }
    
    func fetchData() {
        favBooks.removeAll()
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
                let isFav = data.value(forKey: "isFav") as? Bool
                
                let newBook = Book(name: name, author: author, image: img, date: date, isFavorite: isFav)
                
                favBooks.append(newBook)
            }
        } catch {
            print("err")
        }
    }
    
}
