//
//  AccountsViewController.swift
//  BankAppPractice
//
//  Created by Kelly Douglass on 7/9/18.
//  Copyright © 2018 Kelly Douglass. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	

	let data = ["One", "Two", "Three"]
	
    override func viewDidLoad() {
        super.viewDidLoad()

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
	let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
	
	cell.textLabel?.text = data[indexPath.row]
	
	return cell
}

}
