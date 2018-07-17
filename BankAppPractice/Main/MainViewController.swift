//
//  MainViewController.swift
//  BankAppPractice
//
//  Created by Kelly Douglass on 7/9/18.
//  Copyright © 2018 Kelly Douglass. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	@IBAction func accountPressed(_ sender: UIButton) {
		
		performSegue(withIdentifier: "accountSegue", sender: self)
		
	}
	
	@IBAction func depositPressed(_ sender: UIButton) {
		performSegue(withIdentifier: "depositSegue", sender: self)
	}
	
	@IBAction func transferPressed(_ sender: UIButton) {
		performSegue(withIdentifier: "transferSegue", sender: self)
	}
	
	@IBAction func payBillPressed(_ sender: UIButton) {
		performSegue(withIdentifier: "payBillsSegue", sender: self)
	}
	
	
	
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		func SegueWithTabIndex(index: Int) {
			let destView = segue.destination as? TabViewController
			destView?.selectedIndex = index
		}
		
		switch segue.identifier {
		case "accountSegue":
			SegueWithTabIndex(index: 0)
		case "depositSegue":
			SegueWithTabIndex(index: 1)
		case "transferSegue":
			SegueWithTabIndex(index: 2)
		case "payBillsSegue":
			SegueWithTabIndex(index: 3)
		default:
			SegueWithTabIndex(index: 0)
		}
		
	
	}
	
	
}
