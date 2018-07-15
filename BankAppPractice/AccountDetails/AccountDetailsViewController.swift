//
//  AccountDetailsViewController.swift
//  BankAppPractice
//
//  Created by Kelly Douglass on 7/14/18.
//  Copyright © 2018 Kelly Douglass. All rights reserved.
//

import UIKit
import SwiftyJSON

class AccountDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	

	var passedAccountType : String?
	var passedTransactions : Any?
	
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var accountTitle: UILabel!
	

	
	
	
	let Red = UIColor(red: 191/255.0, green: 22/255.0, blue: 38/255.0, alpha: 1)
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		if let passedAccountType = passedAccountType {
			accountTitle.text = passedAccountType
		}
		
		if let passedTransactions = passedTransactions {
			print(passedTransactions)
		}
		
		
		navigationController?.navigationBar.barTintColor = Red
		UINavigationBar.appearance().tintColor = UIColor.white
		UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]

		
    }

	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DetailTableViewCell
		
		cell?.nameLabel.text = "Name"
		cell?.dateLabel.text = "Date"
		cell?.amountLabel.text = "amount"
		
		return cell!
	}
	
	


}
