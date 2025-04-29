//
//  ViewModel.swift
//  LogicPrecDemo
//
//  Created by Pushpendra Rajput  on 29/04/25.
//

import Foundation
class AddProductViewModel {
    
    private var failblock: BindFail? = nil
    private lazy var repo: AddNewProductRepo? = AddNewProductRepo()
    init(_ bindFailure: @escaping BindFail) {
        self.failblock = bindFailure
    }
    func addProduct(addPoductData : AddProductRequest ,completion:@escaping(_ resStatus:Int,_ resMessage:String,_ resData:ProductList?)->()) {
        repo?.addProduct(addPoductData: addPoductData, completion: { resStatus, resMessage, resData in
            completion(resStatus,resMessage,resData)
        })
    }
    
    

}
