//
//  AccountsViewController.swift
//  BankAppPractice
//
//  Created by Kelly Douglass on 7/9/18.
//  Copyright © 2018 Kelly Douglass. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var data = [
		["type": "Checking Account", "avail": "1234.50", "actual": "123.45"],
		["type": "Savings Account", "avail": "543.00", "actual": "894.37"],
		["type": "Other Acount", "avail": "543.00", "actual": "894.30"]
	]
	
	@IBOutlet weak var tableView: UITableView!
	
	@IBOutlet weak var tableHeight: NSLayoutConstraint!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		viewDidLayoutSubviews()
		
		var frame = self.tableView.frame;
		frame.size.height = CGFloat(data.count * 85);
		self.tableView.frame = frame;
		
		tableHeight.constant = CGFloat(data.count * 85)
		
		//self.tableView.contentSize.height
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	return data.count
}

	
	
	
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	
	let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? AccountsTableViewCell
	
	cell?.accountType.text = data[indexPath.row]["type"]
	cell?.availBalance.text = "$" + data[indexPath.row]["avail"]!
	cell?.actualBalance.text = "$" + data[indexPath.row]["actual"]!
	
	return cell!
}

}
