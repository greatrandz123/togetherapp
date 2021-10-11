//
//  EmployeeListTableViewCell.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 21/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class DashboardTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    private var didAwakeFromNib = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        addBorder( color: UIColor.lightGray.withAlphaComponent(0.5))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
