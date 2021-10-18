//
//  EmployeeListItem.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 21/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class DashboardItem: TableViewItem {
    
    let id: Int
    private let title: String
    private let description: String
    
    init(id: Int, title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
    }
    
    var height: CGFloat {
        return  UITableView.automaticDimension
    }
    
    func cell(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func cell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DashboardTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        cell.titleLabel.textColor = .black
        cell.descriptionLabel.textColor = .black

        //dee2e6
        return cell
    }
}
