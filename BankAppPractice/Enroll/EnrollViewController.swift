//
//  EnrollViewController.swift
//  BankAppPractice
//
//  Created by Kelly Douglass on 7/16/18.
//  Copyright © 2018 Kelly Douglass. All rights reserved.
//

import UIKit
import FirebaseAuth
import SVProgressHUD
class EnrollViewController: UIViewController {

	@IBOutlet weak var emailLabel: UITextField!
	@IBOutlet weak var passwordLabel: UITextField!
	@IBOutlet weak var passwordVerifyLabel: UITextField!
	

	
    override func viewDidLoad() {
        super.viewDidLoad()

	
    }
    

	@IBAction func enrollClicked(_ sender: UIButton) {
		
		SVProgressHUD.show()
		
		var confirmedPass = ""
		
		if passwordLabel.text! == passwordVerifyLabel.text! {
			confirmedPass = passwordLabel.text!
		}
		
		
		
		Auth.auth().createUser(withEmail: self.emailLabel.text!, password: confirmedPass) { (User, error) in
			
			if error != nil {
				print(error!)
				SVProgressHUD.dismiss()
			} else {
				print("user created")
				SVProgressHUD.dismiss()
				self.performSegue(withIdentifier: "returnToLoginSegue", sender: self)
			}
		}
	}
	
	@IBAction func backClicked(_ sender: UIButton) {
		self.performSegue(withIdentifier: "returnToLoginSegue", sender: self)
	}
	

	
}
