//
//  ProductCollectionViewCell.swift
//  E-CommerceAppDemo
//
//  Created by Trupti Mistry on 25/03/25.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var lblCatagory: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblQuntity: UILabel!
    @IBOutlet weak var btnPluse: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    
    @IBOutlet weak var lblPrice
    : UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var ivProduct: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
