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
import SVProgressHUD
import FirebaseAuth
import FirebaseDatabase

class AccountsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var data : [[String:Any]] = []
	var checkingData : [String: Any] = ["type":"Checking", "actual": "", "avail": "", "transactions" : ""]
	var savingsData : [String: Any] = ["type":"Savings", "actual": "", "avail": "", "transactions" : ""]
	
	
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
		
		getCurrentUserData()
		
	}
	
	func getCurrentUserData()  {
		
		
		let user = Auth.auth().currentUser
		let messageDB = Database.database().reference().child((user?.uid)!)
		
		
		messageDB.observeSingleEvent(of: .value) { (snapshot) in
			
			var snap = snapshot.value as! [String: Any]
			
			// Cheking account work
			var checking = snap["checking"]! as! [String : Any]
			let checkingActual = checking["actual"]!
			let checkingAvail = checking["avail"]!
			let checkingTransactions = checking["transactions"]
			self.checkingData["actual"] = "\(checkingActual)"
			self.checkingData["avail"] = "\(checkingAvail)"
			self.checkingData["transactions"] = checkingTransactions
			self.data.append(self.checkingData)
			
			
			// savings Account work
			var savings = snap["savings"]! as! [String : Any]
			let savingsActual = savings["actual"]!
			let savingsAvail = savings["avail"]!
			let savingsTransactions = savings["transactions"]
			self.savingsData["actual"] = "\(savingsActual)"
			self.savingsData["avail"] = "\(savingsAvail)"
			self.savingsData["transactions"] = savingsTransactions
			self.data.append(self.savingsData)
			
			
			
			self.viewDidLayoutSubviews()
			
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
			
			var frame = self.tableView.frame;
			frame.size.height = CGFloat(self.data.count * 85);
			self.tableView.frame = frame;
			
			self.tableHeight.constant = CGFloat(self.data.count * 85)
		}
		
		SVProgressHUD.dismiss()
		
	}
	
	
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.data.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? AccountsTableViewCell
		
		cell?.accountType.text = data[indexPath.row]["type"] as? String
		cell?.availBalance.text = "$\(data[indexPath.row]["avail"]! as! String)"
		cell?.actualBalance.text = "$\(data[indexPath.row]["actual"]! as! String)"
		
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
	
	
	
	@IBAction func logoutPressed(_ sender: Any) {
		
		performSegue(withIdentifier: "logoutToMain", sender: self)
	}
	
}
