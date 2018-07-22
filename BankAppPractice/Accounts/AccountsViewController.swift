//
//  AccountsViewController.swift
//  BankAppPractice
//
//  Created by Kelly Douglass on 7/9/18.
//  Copyright © 2018 Kelly Douglass. All rights reserved.
//

import UIKit
import SVProgressHUD

class AccountsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	let userAccount = UserAccount()
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var tableHeight: NSLayoutConstraint!
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.isNavigationBarHidden = true
		
	}
	
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.navigationController?.isNavigationBarHidden = false
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		userAccount.getCurrentUserData(updateTableUIcallback : refreshTheTableUI)
		
	}
	
	func refreshTheTableUI() {
		self.viewDidLayoutSubviews()
		
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
		
		var frame = self.tableView.frame;
		frame.size.height = CGFloat(userAccount.data.count * 85);
		self.tableView.frame = frame;
		
		self.tableHeight.constant = CGFloat(userAccount.data.count * 85)
		SVProgressHUD.dismiss()
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return userAccount.data.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? AccountsTableViewCell
		
		cell?.accountType.text = self.userAccount.data[indexPath.row]["type"] as? String
		cell?.availBalance.text = "$\(self.userAccount.data[indexPath.row]["avail"]! as! String)"
		cell?.actualBalance.text = "$\(self.userAccount.data[indexPath.row]["actual"]! as! String)"
		
		return cell!
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "AccountDetailSegue" {
			
			let dest : AccountDetailsViewController = segue.destination as! AccountDetailsViewController
			
			let indexPath = self.tableView.indexPathForSelectedRow
			
			
			let accountType = self.userAccount.data[(indexPath?.row)!]["type"]! as! String
			let transactions = self.userAccount.data[(indexPath?.row)!]["transactions"]!
			
			
			dest.passedAccountType = accountType
			dest.passedTransactions = transactions
			
			self.tableView.deselectRow(at: indexPath!, animated: true)
		}
	}
	
	
	
	@IBAction func logoutPressed(_ sender: Any) {
		
		performSegue(withIdentifier: "logoutToMain", sender: self)
	}
	
}
