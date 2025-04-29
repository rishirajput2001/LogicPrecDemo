//
//  Repo.swift
//  LogicPrecDemo
//
//  Created by Pushpendra Rajput  on 29/04/25.
//

import Foundation
import DGNetworkingServices

class AddNewProductRepo {
    
    func addProduct(addPoductData : AddProductRequest ,completion:@escaping(_ resStatus:Int,_ resMessage:String,_ resData:ProductList?)->()) {
        
        let apiUrl = "\(ServiceNameConstant.BaseUrl.baseUrl)\(ServiceNameConstant.AddNewProduct)"
        
        var parameter = [String:Any]()
        parameter["id"] = addPoductData.id
        parameter["title"] = addPoductData.title
        parameter["description"] = addPoductData.description
        parameter["category"] = addPoductData.category
        parameter["price"] = addPoductData.price
        
        DGNetworkingServices.main.dataRequest(Service: NetworkURL(withURL: apiUrl), HttpMethod: .post, parameters: parameter, headers: nil) { status, error, data in
            if status {
                do {
                    let resData = try JSONDecoder().decode(ProductList.self, from: data ?? Data())
                   
                        completion(1,"",resData)
                    
                } catch(let error) {
                    print(error)
                    completion(0,error.localizedDescription,nil)
                }
            } else {

                completion(0,error?.rawValue ?? "",nil)
        }
            
        }
    }
    
}
