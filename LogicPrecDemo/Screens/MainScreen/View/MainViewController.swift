//
//  MainViewController.swift
//  LogicPrecDemo
//
//  Created by Pushpendra Rajput  on 29/04/25.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var clvProduct: UICollectionView!
    @IBOutlet weak var tbvProduct: UITableView!
    
    var productList: [ProductList] = []
    lazy var viewModel: ProductViewModel = {
        ProductViewModel { _ ,_ in
        }
    }()
    
   

    
    fileprivate func loadNib() {
        let nib = UINib(nibName: "ProductListCell", bundle: nil)
        tbvProduct.register(nib, forCellReuseIdentifier: "ProductListCell")
        
        tbvProduct.dataSource = self
        tbvProduct.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        loadNib()
        
        viewModel.fetchProduct { resStatus, resMessage, resData in
            if resStatus == 1 {
                self.productList = resData ?? []
                DispatchQueue.main.async {
                    self.tbvProduct.reloadData()
                }
            } else {
                self.showSimpleAlert(Message: resMessage)
                        }
        }
  
    }
    
    @IBAction func actionAddNewProduct(_ sender: Any) {
        let addNewProductVc = AddProductViewController()
        self.navigationController?.pushViewController(addNewProductVc, animated: true)
    }
    
    
}

