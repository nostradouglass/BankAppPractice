//
//  AccountsTableViewCell.swift
//  BankAppPractice
//
//  Created by Kelly Douglass on 7/10/18.
//  Copyright © 2018 Kelly Douglass. All rights reserved.
//

import UIKit

class AccountsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	@IBOutlet weak var accountType: UILabel!
	@IBOutlet weak var availBalance: UILabel!
	@IBOutlet weak var actualBalance: UILabel!
	
	

}
