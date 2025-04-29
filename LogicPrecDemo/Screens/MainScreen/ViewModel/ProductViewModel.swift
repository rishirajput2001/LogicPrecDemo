//
//  ProductViewModel.swift
//  LogicPrecDemo
//
//  Created by Pushpendra Rajput  on 29/04/25.
//

import Foundation
typealias BindFail = ((_ status: Bool, _ message: String) -> Void)
class ProductViewModel {
    
    private var failblock: BindFail? = nil
    private lazy var repo: ProductRepo? = ProductRepo()
    init(_ bindFailure: @escaping BindFail) {
        self.failblock = bindFailure
    }
    func fetchProduct(completion:@escaping(_ resStatus:Int,_ resMessage:String,_ resData:[ProductList]?)->()) {
        repo?.fetchProduct(completion: { resStatus, resMessage, resData in
            completion(resStatus,resMessage,resData)
        })
    }
    

}

