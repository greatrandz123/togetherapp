//
//  UITableView+Extension.swift
//  TogetherApp
//
//  Created by Randolf Dini-ay on 10/8/21.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(reuseIdentifier: String = T.identifier, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue cell of type \(T.self).")
        }
        return cell
    }
    
    func cellForRow<T: UITableViewCell>(at indexPath: IndexPath) -> T {
        guard let cell = cellForRow(at: indexPath) as? T else {
            fatalError("Failed to dequeue cell of type \(T.self).")
        }
        return cell
    }
    
}

