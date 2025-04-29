//
//  ProductDetailViewController.swift
//  LogicPrecDemo
//
//  Created by Pushpendra Rajput  on 29/04/25.
//

import UIKit
import UserNotifications

class AddProductViewController: UIViewController {

    @IBOutlet weak var txtProductName: customTextField!
    
    @IBOutlet weak var txtCategory: customTextField!
    
   
    @IBOutlet weak var txtDes: customTextField!

    @IBOutlet weak var txtPrice: customTextField!
    

    
    lazy var addViewModel: AddProductViewModel = {
        AddProductViewModel { _ ,_ in
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    @IBAction func actionAddProduct(_ sender: Any) {
        
        let trimmedProductName = txtProductName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let trimmedCategory = txtCategory.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let trimmedPrice = txtPrice.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let trimmedDes = txtPrice.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedProductName.isEmpty {
            showSimpleAlert(Message: "Please enter product name.")
        } else if trimmedCategory.isEmpty {
            showSimpleAlert(Message: "Please enter product category.")
        }
        else if trimmedPrice.isEmpty {
            showSimpleAlert(Message: "Please enter product price.")
        }
        else if trimmedDes.isEmpty {
            showSimpleAlert(Message: "Please enter product description.")
        } else {
            addViewModel.addProduct(addPoductData: AddProductRequest(id: 0, title: txtProductName.text ?? "", description: txtDes.text ?? "", category: txtCategory.text ?? "", price: 0)) { resStatus, resMessage, resData in
                
            }
            
            let content = UNMutableNotificationContent()
                    content.title = "Alert"
                    content.body = "Product added successfully"
                    content.sound = .default

                    // Trigger after 10 seconds
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

                    let request = UNNotificationRequest(
                        identifier: UUID().uuidString,
                        content: content,
                        trigger: trigger
                    )

                    UNUserNotificationCenter.current().add(request) { error in
                        if let error = error {
                            print("❌ Error scheduling notification: \(error.localizedDescription)")
                        } else {
                            print("✅ Notification scheduled in 10 seconds.")
                        }
                    }
                }
            
            let mianViewVc = MainViewController()
            self.navigationController?.pushViewController(mianViewVc, animated: true)
        }
    }
    


