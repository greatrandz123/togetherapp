//
//  TableViewItem.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 14/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

typealias TableViewItemCompletion = (() -> Void)

protocol TableViewItem {
    
    var id: Int { get }

    var height: CGFloat { get }
    
    func cell(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    
    func cell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
}

extension TableViewItem {
    
    
}
