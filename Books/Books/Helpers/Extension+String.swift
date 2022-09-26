//
//  Extension+String.swift
//  Books
//
//  Created by Uzay Altıner on 25.09.2022.
//

import Foundation

extension String {
    func toDateTime() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateFromString = dateFormatter.date(from: self) ?? Date()
        return dateFromString
    }
}
