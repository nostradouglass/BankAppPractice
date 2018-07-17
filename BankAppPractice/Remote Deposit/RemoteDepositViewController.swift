
//
//  RemoteDepositViewController.swift
//  BankAppPractice
//
//  Created by Kelly Douglass on 7/17/18.
//  Copyright © 2018 Kelly Douglass. All rights reserved.
//

import UIKit

class RemoteDepositViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

	@IBAction func logoutPressed(_ sender: Any) {
		performSegue(withIdentifier: "logoutToMain", sender: self)
	}
	
}
