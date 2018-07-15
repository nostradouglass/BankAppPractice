//
//  DetailTableViewCell.swift
//  BankAppPractice
//
//  Created by Kelly Douglass on 7/15/18.
//  Copyright © 2018 Kelly Douglass. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

	

	@IBOutlet weak var nameLabel: UILabel!
	

	@IBOutlet weak var dateLabel: UILabel!
	
	@IBOutlet weak var amountLabel: UILabel!
	
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		
		
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
