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
	
	var transactionsList : [[String:Any]] = [["amount" : "", "date" : "", "name" : ""]]
	
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
		
		var temp = passedTransactions as! [[String:Any]]
		
		func updateTransList() {
			self.transactionsList.removeAll()
			for item in temp {
				transactionsList.append(item)
			}
		}
		
		updateTransList()

		

		
		
		navigationController?.navigationBar.barTintColor = Red
		UINavigationBar.appearance().tintColor = UIColor.white
		UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]

		
    }

	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.transactionsList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DetailTableViewCell
		
		cell?.nameLabel.text = transactionsList[indexPath.row]["name"] as? String
		cell?.dateLabel.text = "\(transactionsList[indexPath.row]["date"]!)"
		cell?.amountLabel.text = "$\(transactionsList[indexPath.row]["amount"]!)"
		
		
		return cell!
	}
	
	


}
