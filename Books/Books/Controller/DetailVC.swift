//
//  DetailVC.swift
//  Books
//
//  Created by Uzay Altıner on 26.09.2022.
//

import UIKit

class DetailVC: UIViewController {
    var choosenBook: Book?

    @IBOutlet var detailImgView: UIImageView!
    
    @IBOutlet var detailNameLabel: UILabel!
    
    @IBOutlet var detailAuthorLabel: UILabel!
    
    @IBOutlet var detailDateLabel: UILabel!
    
    @IBOutlet var starBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupBookDetail()
    }

    func setupBookDetail() {
        if let choosenBook {
            detailImgView.downloaded(from: choosenBook.image!)
            detailNameLabel.text = choosenBook.name!
            detailAuthorLabel.text = choosenBook.author!
            detailDateLabel.text = choosenBook.date!
            starBarButtonItem.image = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
            starBarButtonItem.tintColor = choosenBook.isFavorite! ? .systemYellow : .systemGray
        }
    }
    
    @IBAction func starButtonTapped(_ sender: Any) {
        if choosenBook?.isFavorite == false {
            choosenBook?.isFavorite = true
            CoreDataHandler().saveToCoreData(choosenBook: choosenBook!)
            starBarButtonItem.tintColor = .systemYellow
        } else {
            choosenBook?.isFavorite = false
            starBarButtonItem.tintColor = .gray
            CoreDataHandler().deleteFromCoreData(choosenBook: choosenBook!)
        }
    }
}
