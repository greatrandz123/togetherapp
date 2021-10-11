//
//  TableViewSection.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 14/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

protocol TableViewSection {
    var items: [TableViewItem] { set get }
    
    var height: CGFloat { get }
    
    func headerView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView?
}

extension TableViewSection {
    
}
