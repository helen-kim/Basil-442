//
//  DirecitonsTableViewCell.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/4/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import UIKit

class DirectionsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var directionName: UILabel!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
