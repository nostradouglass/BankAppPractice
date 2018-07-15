//
//  AccountsViewController.swift
//  BankAppPractice
//
//  Created by Kelly Douglass on 7/9/18.
//  Copyright © 2018 Kelly Douglass. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AccountsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var data : [[String:Any]] = []
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var tableHeight: NSLayoutConstraint!
	

	
	
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.isNavigationBarHidden = true
		
		
	}
	
	func updateAccountData(jsonAccounts: JSON) {
		
		var temp = [[String: Any]]()
		
		for i in 0...jsonAccounts.count - 1 {
			let type = jsonAccounts[i]["type"].stringValue
			let avail = jsonAccounts[i]["avail"].stringValue
			let actual = jsonAccounts[i]["actual"].stringValue
			let transactions = jsonAccounts[i]["transactions"]
			
			temp.append(["type" : type, "avail" : avail, "actual" : actual, "transactions" : transactions])
			
		}
		
		data = temp
		
		var frame = self.tableView.frame;
		frame.size.height = CGFloat(self.data.count * 85);
		self.tableView.frame = frame;
		
		tableHeight.constant = CGFloat(self.data.count * 85)
		
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.navigationController?.isNavigationBarHidden = false
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		getDataFromAPI()
		
		viewDidLayoutSubviews()
		
		var frame = self.tableView.frame;
		frame.size.height = CGFloat(self.data.count * 85);
		self.tableView.frame = frame;
		
		tableHeight.constant = CGFloat(self.data.count * 85)
		
	}
	
	func getDataFromAPI() {
		
		Alamofire.request("http://localhost:3000/accounts").responseJSON { response in
			
			let accountData : JSON = JSON(response.result.value!)
			
			self.updateAccountData(jsonAccounts: accountData)
			
		}
		
	}
	
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.data.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? AccountsTableViewCell
		
		cell?.accountType.text = data[indexPath.row]["type"] as? String
		cell?.availBalance.text = data[indexPath.row]["avail"]! as? String
		cell?.actualBalance.text = data[indexPath.row]["actual"]! as? String
		
		return cell!
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "AccountDetailSegue" {
			
			let dest : AccountDetailsViewController = segue.destination as! AccountDetailsViewController
			
			let indexPath = self.tableView.indexPathForSelectedRow
		
			
			let accountType = self.data[(indexPath?.row)!]["type"]! as! String
			let transactions = self.data[(indexPath?.row)!]["transactions"]!
			
			
		dest.passedAccountType = accountType
		dest.passedTransactions = transactions
			
			self.tableView.deselectRow(at: indexPath!, animated: true)
		}
	}
	
	
}
