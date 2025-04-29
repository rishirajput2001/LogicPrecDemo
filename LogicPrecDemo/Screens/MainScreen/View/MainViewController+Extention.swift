//
//  MainViewController+Extention.swift
//  LogicPrecDemo
//
//  Created by Pushpendra Rajput  on 29/04/25.
//

import UIKit
import SDWebImage
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListCell", for: indexPath) as? ProductListCell
        let data = productList[indexPath.row]
        
        cell?.lblProductName.text = data.title
        cell?.lblCatName.text = data.category
        cell?.lblPrice.text = "\(data.price ?? 0)"
        cell?.lblDescription.text = data.description
        
        let imageUrl = URL(string: "\(data.images?.first ?? "")")
        cell?.imgProduct.sd_setImage(with: imageUrl, placeholderImage: UIImage())
        
        
        
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.view.layoutIfNeeded()
            //            self.tbvHeight.constant = self.tbvThreds.contentSize.height
        }
    }
    
    //    func tableView(_ tableView: UITableView,
    //                   commit editingStyle: UITableViewCell.EditingStyle,
    //                   forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            // Step 1: Remove from data source
    //            productList.remove(at: indexPath.row)
    //
    //            // Step 2: Delete the row from the table view
    //            tableView.deleteRows(at: [indexPath], with: .automatic)
    //        }
    //    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Remove") { (action, view, completion) in
            self.productList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
            
            
            let content = UNMutableNotificationContent()
            content.title = "Alert"
            content.body = "Product deleted successfully"
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
        
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
}


