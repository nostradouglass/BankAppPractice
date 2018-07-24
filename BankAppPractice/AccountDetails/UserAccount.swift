//
//  UserAccount.swift
//  BankAppPractice
//
//  Created by Kelly Douglass on 7/22/18.
//  Copyright © 2018 Kelly Douglass. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import FirebaseAuth
import FirebaseDatabase

class UserAccount  {
	
	var data : [[String:Any]] = []
	var checkingData : [String: Any] = ["type":"Checking", "actual": "", "avail": "", "transactions" : ""]
	var savingsData : [String: Any] = ["type":"Savings", "actual": "", "avail": "", "transactions" : ""]
	
	
	func getCurrentUserData(updateTableUIcallback: @escaping ()->() )  {
		
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
			updateTableUIcallback()
		}
	}
	
}
