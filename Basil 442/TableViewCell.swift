//
//  TableViewCell.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/2/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var cellRecipeName: UILabel!
    @IBOutlet weak var prepTime: UILabel!

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
