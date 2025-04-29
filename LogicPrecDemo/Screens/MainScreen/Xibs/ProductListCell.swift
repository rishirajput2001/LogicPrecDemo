//
//  ProductListCell.swift
//  LogicPrecDemo
//
//  Created by Pushpendra Rajput  on 29/04/25.
//

import UIKit

class ProductListCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblCatName: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 13
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.lightGray.cgColor
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOpacity = 0.1
        mainView.layer.shadowOffset = CGSize(width: 1, height: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
