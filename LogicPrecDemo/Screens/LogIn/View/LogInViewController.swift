//
//  LogInViewController.swift
//  LogicPrecDemo
//
//  Created by Pushpendra Rajput  on 29/04/25.
//

import UIKit
import PhoneNumberKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtPassword: customTextField!
    @IBOutlet weak var txtMobileNo: PhoneNumberTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtMobileNo.withFlag = true
        txtMobileNo.withPrefix = true
        txtMobileNo.withExamplePlaceholder = true
        txtMobileNo.delegate = self
    }
    
    @IBAction func actionContinue(_ sender: Any) {
        let trimmedPhone = txtMobileNo.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let trimmedPassword = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)

            if trimmedPhone.isEmpty {
                showSimpleAlert(Message: "Please enter your phone number.")
            } else if trimmedPassword.isEmpty {
                showSimpleAlert(Message: "Please enter your password.")
            } else {
                // Proceed with login or next steps
                print("Phone and password are valid.")
                
                UserDefaults.standard.setValue(true, forKey: "isLogin")
                
                let mianViewVc = MainViewController()
                self.navigationController?.pushViewController(mianViewVc, animated: true)
            }
        
    }
    func removeSpaces(from string: String) -> String {
        return string.replacingOccurrences(of: " ", with: "")
    }
    
    func isValidPhoneNumber(_ phone: String) -> Bool {
        let phoneRegex = "^[0-9]{10}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return predicate.evaluate(with: phone)
    }

}
