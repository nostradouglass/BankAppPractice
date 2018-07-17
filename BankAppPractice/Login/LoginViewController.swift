//
//  ViewController.swift
//  BankAppPractice
//
//  Created by Kelly Douglass on 7/9/18.
//  Copyright © 2018 Kelly Douglass. All rights reserved.
//

import UIKit
import FirebaseAuth
import SVProgressHUD

class LoginViewController: UIViewController, UITextFieldDelegate  {

	@IBOutlet weak var emailText: UITextField!
	@IBOutlet weak var passwordText: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		emailText.delegate = self
		passwordText.delegate = self
		
	}
	
	func createAlert(title: String, message: String) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
		
		alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
			self.dismiss(animated: true, completion: nil)
		}))
		
		
		self.present(alertController, animated: true, completion: nil)
		
	}
	

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		emailText.resignFirstResponder()
		passwordText.resignFirstResponder()
		return true
	}
	
	
	@IBAction func loginClicked(_ sender: Any) {
		
		SVProgressHUD.show()
		
		Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
			
			if error != nil {
				print(self.passwordText.text!)
				print(error!)
				
				self.createAlert(title: "Problem logging in", message: "Please try again")
			}  else {
				self.emailText.text = ""
				self.passwordText.text = ""
				SVProgressHUD.dismiss()
				self.performSegue(withIdentifier: "toMainSegue", sender: self)
				
			}
			
		}
		
	}
	
	
@IBAction func unwindToMain(segue:UIStoryboardSegue) { }
	// Used by other storyboard views logout button to return to login screen
}

